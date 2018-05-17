class SeasonsController < ApplicationController

  before_action :set_season, only: %i[show update destroy]

  # GET /seasons
  def index
    @seasons = if params[:show_id].present?
                 Season.where(show_id: params[:show_id])
               else
                 Season.all
               end
    render json: { seasons: @seasons }
  end

  # GET /seasons/1
  def show
    render json: { seasons: @season }
  end

  # POST /seasons
  def create

    @season = Season.new(season_params)

    if @season.save
      render json: { seasons: @season }, status: :created, location: @season
    else
      render json: @season.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /seasons/1
  def update

    if @season.update(season_params)
      render json: { seasons: @season }
    else
      render json: @season.errors, status: :unprocessable_entity
    end

  end

  # DELETE /seasons/1
  def destroy
    @season.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_season
    @season = Season.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def season_params
    params.fetch(:season, {})
  end

end
