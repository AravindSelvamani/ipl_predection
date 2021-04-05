class IncreasePointsController < ApplicationController
  before_action :set_increase_point, only: %i[ show edit update destroy ]
  # GET /increase_points or /increase_points.json
  def index
    @increase_points = IncreasePoint.all
  end

  # GET /increase_points/1 or /increase_points/1.json
  def show
  end

  # GET /increase_points/new
  def new
    @increase_point = IncreasePoint.new
  end

  def increase_user_points
    @match_predections = MatchPredection.all
    @users = User.all.order(point: :desc)
    winner2 = @increase_point.winner2 
    @match1_winners = @match_predections.where(date: @increase_point.date, winners1: @increase_point.winner1 )
    @match1_winners.each do |winner|
      user = @users.find_by_name(winner.name)
      user.point +=1 
      user.save!
    end
    unless winner2.empty?
      @match2_winners = @match_predections.where(date: @increase_point.date, winners2: @increase_point.winner2)
      @match2_winners.each do |winner| 
        user = @users.find_by_name(winner.name)
        user.point +=1 
        user.save!
      end
    end
  end

  def get_date
    today = Time.now.utc.strftime("%d-%b-%y")
    match_start_date = "9-Apr-21"
    today >= match_start_date ? today : match_start_date
  end

  def daywise_winners_list
    winners_team = IncreasePoint.all.find_by(date: get_date)
    match_schedule = MatchPredectionsHelper::MATCH_SCHEDULE[get_date]
    winner_team1 = winners_team.winner1
    winner_team2 = winners_team.winner2
    winners2 = nil
    matches = []
    match_schedule.each do |match|
      matches << "#{match['team1']} VS #{match['team2']}"
    end
    match1 = matches[0]
    match2 = matches[1]
    winners1 = MatchPredection.all.where(date: get_date, winners1: winner_team1).select('name').map{|b| b.name}.join(', ')
    unless winner_team2.empty?
      winners2 = MatchPredection.all.where(date: get_date, winners2: winner_team2).select('name').map{|b| b.name}.join(', ')
    end
    winners_list = WinnerTeamsUser.new({date: get_date, winners1: winners1, winners2: winners2,match1: match1, match2: match2, team1: winner_team1,team2: winner_team2})
    winners_list.save!
  end

  def view_winners
  end

  def check_password(increase_point_params)
    increase_point_params['password'] == '123'
  end

  # GET /increase_points/1/edit
  def edit
  end

  # POST /increase_points or /increase_points.json
  def create
    if check_password(increase_point_params)
      @increase_point = IncreasePoint.new(increase_point_params)

      respond_to do |format|
        if @increase_point.save
          format.html { redirect_to root_path, success: "Increase point was successfully created." }
          increase_user_points
          daywise_winners_list
        else
          format.html { render :new, danger: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /increase_points/1 or /increase_points/1.json
  # def update
  #   respond_to do |format|
  #     if @increase_point.update(increase_point_params)
  #       format.html { redirect_to @increase_point, notice: "Increase point was successfully updated." }
  #       format.json { render :show, status: :ok, location: @increase_point }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @increase_point.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /increase_points/1 or /increase_points/1.json
  # def destroy
  #   @increase_point.destroy
  #   respond_to do |format|
  #     format.html { redirect_to increase_points_url, notice: "Increase point was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_increase_point
      @increase_point = IncreasePoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def increase_point_params
      params.require(:increase_point).permit(:date, :winner1, :winner2, :password)
    end
end
