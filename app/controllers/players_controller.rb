class PlayersController < ApplicationController
  # before_filter :authenticate_player!
  def show
    @player = Player.find(params[:id])
    @matches = Match.all
    @match = Match.find(params[:id])
  end
end
