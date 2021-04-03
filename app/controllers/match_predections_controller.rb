class MatchPredectionsController < ApplicationController
  before_action :set_match_predection, only: %i[ show edit update destroy ]
  # GET /match_predections or /match_predections.json
  def index
    @match_predections = MatchPredection.all
    @new_match_predection = MatchPredection.new
  end

  # GET /match_predections/1 or /match_predections/1.json
  def show
  end

  # GET /match_predections/new
  def new
    @match_predection = MatchPredection.new
  end

  # GET /match_predections/1/edit
  def edit
  end

  # POST /match_predections or /match_predections.json
  def create
    @match_predection = MatchPredection.new(match_predection_params)

    respond_to do |format|
      if @match_predection.save
        format.html { redirect_to @match_predection, notice: "Match predection was successfully created." }
        format.json { render :show, status: :created, location: @match_predection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match_predection.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /match_predections/1 or /match_predections/1.json
  def update
    respond_to do |format|
      if @match_predection.update(match_predection_params)
        format.html { redirect_to @match_predection, notice: "Match predection was successfully updated." }
        format.json { render :show, status: :ok, location: @match_predection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match_predection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_predections/1 or /match_predections/1.json
  def destroy
    @match_predection.destroy
    respond_to do |format|
      format.html { redirect_to match_predections_url, notice: "Match predection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_predection
      @match_predection = MatchPredection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_predection_params
      params.require(:match_predection).permit(:name, :date, :winners1, :winners2)
    end
end
