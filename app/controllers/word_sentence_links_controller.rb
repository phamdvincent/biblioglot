class WordSentenceLinksController < ApplicationController
  before_action :set_word_sentence_link, only: %i[ show edit update destroy ]

  # GET /word_sentence_links or /word_sentence_links.json
  def index
    @word_sentence_links = WordSentenceLink.all
  end

  # GET /word_sentence_links/1 or /word_sentence_links/1.json
  def show
  end

  # GET /word_sentence_links/new
  def new
    @word_sentence_link = WordSentenceLink.new
  end

  # GET /word_sentence_links/1/edit
  def edit
  end

  # POST /word_sentence_links or /word_sentence_links.json
  def create
    @word_sentence_link = WordSentenceLink.new(word_sentence_link_params)

    respond_to do |format|
      if @word_sentence_link.save
        format.html { redirect_to word_sentence_link_url(@word_sentence_link), notice: "Word sentence link was successfully created." }
        format.json { render :show, status: :created, location: @word_sentence_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @word_sentence_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_sentence_links/1 or /word_sentence_links/1.json
  def update
    respond_to do |format|
      if @word_sentence_link.update(word_sentence_link_params)
        format.html { redirect_to word_sentence_link_url(@word_sentence_link), notice: "Word sentence link was successfully updated." }
        format.json { render :show, status: :ok, location: @word_sentence_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @word_sentence_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_sentence_links/1 or /word_sentence_links/1.json
  def destroy
    @word_sentence_link.destroy

    respond_to do |format|
      format.html { redirect_to word_sentence_links_url, notice: "Word sentence link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_sentence_link
      @word_sentence_link = WordSentenceLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_sentence_link_params
      params.require(:word_sentence_link).permit(:sentence_id, :word_id, :language_id, :book_id, :index_in_sentence, :word_audio_timestamp)
    end
end
