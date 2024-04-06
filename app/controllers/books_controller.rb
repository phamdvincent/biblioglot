require_relative "../services/nlp/nlp_service"
include Nlp

require_relative "../services/translation/translation_service"
include Translation

require_relative "../services/dictionary/dictionary_service"
include Dictionary

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

    save_sentences(language, @book.id, @processed_story)

    redirect_to "/books/#{@book.id}/show"
    # puts @book.sentences
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

  def save_sentences(language, book_id, processed_story)
    processed_story.each_with_index do |item, sentence_index_in_story|
      translation = "translation_placeholder" # TranslationService.get_translation(language, item["sentence"])
      audio_path = "audio_path_placeholder" # TO ADD!!! DONT FORGET!!!!!
      sentence = Sentence.new(book_id: book_id, content: item["sentence"], language_id: @book.language_id, audio: audio_path, english_translation: translation, index_in_book: sentence_index_in_story)
      sentence.save

      save_words(language, sentence.id, item["tokens"])
    end
  end

  def save_words(language, sentence_id, tokens)
    tokens.each_with_index do |token, word_index_in_sentence|
      if token["upos"] != "PUNCT"
        word_text = token["text"].downcase

        # audio_word = generate_audio_data(language, word_text)
        audio_object_key = "audio_path_placeholder" # save_audio_to_storage(audio_word, "word")
        word_in_db = Word.find_by(content: word_text)

        if !word_in_db
          word = Word.new({ content: word_text, audio: audio_object_key, language_id: @book.language_id })
          word.save
          word_in_db = word
          save_definitions(language, word_in_db.id, token)
        end
        
        word_audio_timestamp = "word_audio_timestamp_placeholder"
        word_sentence_link = WordSentenceLink.new({ sentence_id: sentence_id, word_id: word_in_db.id, language_id: @book.language.id, book_id: @book.id, index_in_sentence: word_index_in_sentence, word_audio_timestamp: word_audio_timestamp })
        word_sentence_link.save

      end
    end
  end

  def save_definitions(language, word_in_db_id, token)
    nlp_upos = token["upos"]
    word_json_list = DictionaryService.get_word_json_list(language, token["text"].downcase)
    word_json_list.each do |item|
      dict_pos = item["pos"]
      if item["senses"].at(0).key?("glosses")
        definition_text = item["senses"].at(0)["glosses"]
      else
        definition_text = "Definition not found"
      end

      definition = Definition.new({ word_id: word_in_db_id, definition: definition_text, dict_pos: dict_pos, language_id: @book.language_id, nlp_upos: nlp_upos })
      definition.save
    end
  end
end
