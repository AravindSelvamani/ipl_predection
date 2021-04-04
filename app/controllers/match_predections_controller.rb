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

  def create_users
    name = @match_predection.name
    @users = User.all
    user_data = @users.find_by_name(name)
    unless user_data
      user_data = {"name"=>name, "point"=>0}
      user = User.new(user_data)
      user.save!
    end
  end

  def all_match_predection
    @all_match_predection = MatchPredection.all
  end

  def is_match_predection_present?(match_predection_params)
    all_match_predection
    @all_match_predection.find_by(name: match_predection_params['name'], date: Time.now.utc.strftime("%d-%b-%y") )
  end

  def update_values(match_predection_params)
    all_match_predection
    match_schedule = HomeHelper::MATCH_SCHEDULE['18-Apr-21']
    match_schedule.each_with_index do |match,i|
      unless match['start_time'] > Time.now.utc
        existing_data = is_match_predection_present?(match_predection_params)
        if existing_data
          current_value = existing_data["winners#{i+1}"]
          match_predection_params["winners#{i+1}"] = current_value
          puts "existing here #{match_predection_params}"
        else
          match_predection_params["winners#{i+1}"] = nil
          puts "existing there #{match_predection_params}"
        end
      end
    end
    match_predection_params
  end

  # POST /match_predections or /match_predections.json
  def create
    update_match_predection_params = update_values(match_predection_params)
    @match_predections = MatchPredection.all
    existing_user_data = is_match_predection_present?(update_match_predection_params)
    
    if existing_user_data
      existing_user_data.winners1 = update_match_predection_params['winners1']
      existing_user_data.winners2 = update_match_predection_params['winners2']
      existing_user_data.save!
      # flash.now[:success] = "Match predection was successfully updated"
    else
      @match_predection = MatchPredection.new(update_match_predection_params)
      respond_to do |format|
        if @match_predection.save
          format.html { redirect_to @match_predection, notice: "Match predection was successfully created." }
          format.json { render :show, status: :created, location: @match_predection }
          create_users
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @match_predection.errors, status: :unprocessable_entity }
        end
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
