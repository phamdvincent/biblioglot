class DefinitionsController < ApplicationController
  before_action :set_definition, only: %i[ show edit update destroy ]

  # GET /definitions or /definitions.json
  def index
    @definitions = Definition.all
  end

  # GET /definitions/1 or /definitions/1.json
  def show
  end

  # GET /definitions/new
  def new
    @definition = Definition.new
  end

  # GET /definitions/1/edit
  def edit
  end

  # POST /definitions or /definitions.json
  def create
    @definition = Definition.new(definition_params)

    respond_to do |format|
      if @definition.save
        format.html { redirect_to definition_url(@definition), notice: "Definition was successfully created." }
        format.json { render :show, status: :created, location: @definition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /definitions/1 or /definitions/1.json
  def update
    respond_to do |format|
      if @definition.update(definition_params)
        format.html { redirect_to definition_url(@definition), notice: "Definition was successfully updated." }
        format.json { render :show, status: :ok, location: @definition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /definitions/1 or /definitions/1.json
  def destroy
    @definition.destroy

    respond_to do |format|
      format.html { redirect_to definitions_url, notice: "Definition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition
      @definition = Definition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def definition_params
      params.require(:definition).permit(:word_id, :definition, :dict_pos, :language_id, :nlp_pos)
    end
end
