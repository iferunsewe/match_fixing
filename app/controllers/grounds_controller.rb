class GroundsController < ApplicationController
  before_filter :authenticate_player!
  before_action :set_ground, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /grounds
  # GET /grounds.json
  def index
    @grounds = Ground.all
  end

  # GET /grounds/1
  # GET /grounds/1.json
  def show

  end

  # GET /grounds/new
  def new
    @ground = Ground.new
  end

  # GET /grounds/1/edit
  def edit
  end

  # POST /grounds
  # POST /grounds.json
  def create
    @ground = Ground.new(ground_params)

    respond_to do |format|
      if @ground.save
        format.html { redirect_to @ground, notice: 'Ground was successfully created.' }
        format.json { render :show, status: :created, location: @ground }
      else
        format.html { render :new }
        format.json { render json: @ground.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grounds/1
  # PATCH/PUT /grounds/1.json
  def update
    respond_to do |format|
      if @ground.update(ground_params)
        format.html { redirect_to @ground, notice: 'Ground was successfully updated.' }
        format.json { render :show, status: :ok, location: @ground }
      else
        format.html { render :edit }
        format.json { render json: @ground.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grounds/1
  # DELETE /grounds/1.json
  def destroy
    @ground.destroy
    respond_to do |format|
      format.html { redirect_to grounds_url, notice: 'Ground was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ground
      @ground = Ground.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ground_params
      params.require(:ground).permit(:address, :name, :image,
                                     match_attributes: [:date, :status, :team_a_score, :team_b_score, :team_a_id,
                                                                                 :team_b_id])
    end
end
