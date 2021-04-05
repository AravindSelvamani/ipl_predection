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

  def check_password(increase_point_params)
    increase_point_params['password'] == ENV['PASSWORD']
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
