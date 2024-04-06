require_relative "../services/nlp/nlp_service"
include Nlp

require_relative "../services/translation/translation_service"
include Translation

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
    @processed_text = NlpService.get_nlp(language, story_text) # nlp
    @processed_text.each do |item|
      translation = "translation_placeholder" # TranslationService.get_translation(language, item["sentence"])
      audio_path = "audio_path_placeholder" # TO ADD!!! DONT FORGET!!!!!
      sentence = Sentence.new(book_id: @book.id, content: item["sentence"], language_id: @book.language_id, audio: audio_path, english_translation: translation)
      sentence.save
      puts "id: #{sentence.id}"
    end
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

  def get_words_json(language, tokens)
    tokens.each do |token|
      if token["upos"] != "PUNCT"
        word = token["text"].downcase

        # audio_word = generate_audio_data(language, word)
        audio_object_key = "audio_path_placeholder" # save_audio_to_storage(audio_word, "word")

        word_json_list = Dictionary_Service.get_word_json_list(language, word)
        word_json_list.each do |item|
          part_of_speech = item["pos"]
          if item["senses"].at(0).key?("glosses")
            definition = item["senses"].at(0)["glosses"]
          else
            definition = "not found"
          end

          word_db = Word.new({ word: word, part_of_speech: part_of_speech, definition: definition, audio: audio_object_key})
          # word_db.save
        end
        # word_hash = {"word": word, "json": word_json_list}
        # @words.append(word_hash)
      end
    end
  end
end
