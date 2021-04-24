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
    name = @match_predection.name.strip
    password = @match_predection.password.strip
    user_data = find_user(name)
    unless user_data
      user_data = {"name"=>name.capitalize, "point"=>0, "password"=>password}
      user = User.new(user_data)
      user.save!
      puts "New user created"
    end
  end

  def all_match_predection
    @all_match_predection = MatchPredection.all
  end

  def is_match_predection_present?(match_predection_params)
    all_match_predection
    @all_match_predection.find_by(name: match_predection_params['name'], date: MatchPredectionsHelper.get_date )
  end

  def find_user(name)
    @users = User.all
    @users.find_by_name(name)
  end

  # def get_date
  #   today = Time.now.strftime("%d-%b-%y")
  #   match_start_date = "9-Apr-21"
  #   today >= match_start_date ? today : match_start_date
  # end

  def name_capitalize(match_predection_params)
    match_predection_params['name'].capitalize!
  end

  def update_values(match_predection_params)
    all_match_predection
    get_date = MatchPredectionsHelper.get_date
    match_schedule = MatchPredectionsHelper::MATCH_SCHEDULE[get_date]
    @flash_error_message = ""
    match_schedule.each_with_index do |match, i|
      unless (match['start_time'] > Time.now.utc.strftime("%H:%M") || Time.parse(get_date) > Time.now)
        existing_data = is_match_predection_present?(match_predection_params)
        if existing_data
          current_value = existing_data["winners#{i+1}"]
          match_predection_params["winners#{i+1}"] = current_value
          puts "existing here #{match_predection_params}"
          @flash_error_message += "Predection Time closed for Match #{i+1}. Value can't be updated <br>"
        else
          match_predection_params["winners#{i+1}"] = nil
          puts "existing there #{match_predection_params}"
          @flash_error_message += "Predection Time closed for Match #{i+1}. <br>"
        end
        
      end
    end
    match_predection_params
  end

  # POST /match_predections or /match_predections.json
  def create
    user_detail = find_user(match_predection_params['name'])
    if (user_detail.nil? || (user_detail['password'] == match_predection_params['password']))
      name_capitalize(match_predection_params)
      update_match_predection_params = update_values(match_predection_params)
      @match_predections = MatchPredection.all
      existing_user_data = is_match_predection_present?(update_match_predection_params)

      if existing_user_data
          existing_user_data.winners1 = update_match_predection_params['winners1']
          existing_user_data.winners2 = update_match_predection_params['winners2']
          if !(update_match_predection_params['winners1'].nil? && update_match_predection_params['winners2'].nil?)
            existing_user_data.save!
            puts "Existing Match Predection data Updated \n #{existing_user_data}"
            respond_to do |format|
              unless @flash_error_message.empty?
                format.html { redirect_to root_path, danger: @flash_error_message.html_safe }
              else
                format.html { redirect_to root_path, success: "Match predection was successfully updated" }
              end
            end
          else 
            respond_to do |format|
              format.html { redirect_to root_path, danger: @flash_error_message.html_safe }
            end     
          end
      else
        update_match_predection_params['name'] = update_match_predection_params['name'].strip
        @match_predection = MatchPredection.new(update_match_predection_params)
        puts "New created Match Predection data created"
        if !(update_match_predection_params['winners1'].nil? && update_match_predection_params['winners2'].nil?)
          respond_to do |format|
            if @match_predection.save
              unless @flash_error_message.empty?
                format.html { redirect_to root_path, danger: @flash_error_message.html_safe }
              else
                format.html { redirect_to root_path, success: "Match predection was successfully created." }
              end
              puts "New created Match Predection data created data \n #{@match_predection}"
              create_users
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @match_predection.errors, status: :unprocessable_entity }
            end
          end
        else
          respond_to do |format|
              format.html { redirect_to root_path, danger: @flash_error_message.html_safe }
            end     
        end
        
      end
    else
      puts "Password incorrect"
      respond_to do |format|
        format.html { redirect_to root_path, danger: "Update failed Invalid password".html_safe }
      end
    end
    @flash_error_message = nil
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
      params.require(:match_predection).permit(:name, :date, :winners1, :winners2, :password)
    end
end
