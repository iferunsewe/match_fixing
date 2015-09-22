class PlayersController < ApplicationController
  before_filter :authenticate_player!
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def create
    Player.create(user_params)
  end

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @matches = Match.all.sort_by &:date
    # @match = Match.find(params[:id]
    @rating = Rating.where(player_id: current_player.id)
  end


  def edit
  end

  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to player_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_params
    params.require(:player).permit(:name, :dob, :position, :hometown, :captain,
                                   :weight,:height, :password, :email, :foot, :specialities, :team_id,
                                   :image, :remote_image_url, stat_attributes:[:goals, :appearance, :man_of_the_match])
  end
end
