class TeamsController < ApplicationController
  before_filter :authenticate_player!, except: [:index]
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :update_team_stats, only: [:index, :show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /teams
  # GET /teams.json
  def index
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    # respond_to do |format|
    #   format.html
    #   format.css
    # end
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    # Adds the player creating the team to the created team and makes them captain by default
    @team.players << current_player
    first_player = @team.players[0]
    first_player.captain = true
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :image, :hometown, :played, :wins, :losses, :draws, :primary_colour, :secondary_colour,
                                   :rating, :seeking_players, :philosophy,
                                   player_attributes: [:name, :dob, :position, :hometown, :captain,
                                                       :weight,:height, :foot, :specialities])
    end

    def update_team_stats
      # Used for calculating the stats for the leadertable
      @teams = Team.all
      @teams.map do |team|
        team.update(played: team.calc_matches(team) ,wins: team.calc_wins(team), losses: team.calc_losses(team), draws: team.calc_draws(team), points: team.calc_points)
      end
      @teams = @teams.order(points: :desc)
    end
end
