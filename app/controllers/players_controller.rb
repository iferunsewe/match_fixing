class PlayersController < ApplicationController
  # before_filter :authenticate_player!
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    # @matches = Match.all
    # @match = Match.find(params[:id])
    @rating = Rating.where(player_id: @player.id)
  end


  def edit
  end

  def update
    # Updating the average rating of player
    # if params[:player][:rating].present?
    #   binding.pry
    #   new_rating = params[:player][:rating].to_i
    #   params[:player][:rating] = @player.average_rating(new_rating)
    # end
    # @player.ratings = Rating.new

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
                                   :weight,:height, :password, :email)
  end

end
