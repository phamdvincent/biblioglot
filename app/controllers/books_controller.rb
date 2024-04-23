require_relative "../services/nlp/nlp_service"
include Nlp

require_relative "../services/translation/translation_service"
include Translation

require_relative "../services/dictionary/dictionary_service"
include Dictionary

require_relative "../services/audio/audio_service"
include Audio

require_relative "../services/storage/storage_service"
include Storage

require "securerandom"

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
    @progress = Progress.new
  end

  # GET /books/1 or /books/1.json
  def show
    if !current_user.books.include?(@book)
      current_user.books << @book
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def process_text
    @book = Book.find(params[:book_id])
    language = @book.language.language_code
    story_text = params[:story_text]
    @processed_story = NlpService.get_nlp(language, story_text) # nlp

    save_story_to_db(language, @book.id, @processed_story)

    redirect_to "/books/#{@book.id}"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :author, :language_id, :publication_year)
  end

  def save_story_to_db(language, book_id, processed_story)
    save_sentences(language, book_id, processed_story)
  end

  def save_sentences(language, book_id, processed_story)
    if @book.sentences.empty?
      sentence_index_in_book = 0
    else
      sentence_index_in_book = Sentence.maximum(:index_in_book) + 1
    end
    processed_story.each do |item|
      sentence_object = Sentence.new
      sentence_object.populate_sentence(language, item, sentence_index_in_book, @book)
      sentence_object.save

      word_audio_timestamps = sentence_object.get_audio_timestamps(language, item["sentence"])

      sentence_index_in_book += 1
      save_words(language, sentence_object, item["tokens"], word_audio_timestamps)
    end
  end

  def save_words(language, sentence_object, tokens, word_audio_timestamps)
    word_index_in_sentence = 0
    do_not_do_tokens = []
    tokens.each do |token|
      if token["upos"] != "PUNCT" && !do_not_do_tokens.include?(token["id"])
        if token["id"].kind_of?(Array)
          token["id"].each do |id|
            do_not_do_tokens.append(id)
          end
        end
        word_text = token["text"].downcase

        word_in_db = Word.find_by(content: word_text)

        if !word_in_db
          word = Word.new
          word.populate_word(language, token, word_index_in_sentence, @book)
          word.save
          word_in_db = word
          save_definitions(language, word_in_db, token)
        end

        word_sentence_link = WordSentenceLink.new
        word_sentence_link.populate_word_sentence_link(@book, sentence_object, word_in_db, word_index_in_sentence, word_audio_timestamps)
        word_sentence_link.save
        word_index_in_sentence += 1
      end
    end
  end

  def save_definitions(language, word_in_db, token)
    dictionary_definitions = word_in_db.get_word_dictionary_data(language, token)
    dictionary_definitions.each do |definition|
      definition_object = Definition.new
      definition_object.populate_definition(language, word_in_db, token, @book, definition)
      definition_object.save
    end
  end
end
