class EpisodesController < ApplicationController

  before_action :set_episode, only: %i[show update destroy]

  # GET /episodes
  def index
    @episodes = if params[:season_id].present?
                  Episode.where(season_id: params[:season_id])
                else
                  Episode.all
                end
    render json: { episodes: @episodes }
  end

  # GET /episodes/1
  def show
    render json: { episodes: @episode }
  end

  # POST /episodes
  def create

    @episode = Episode.new(episode_params)

    if @episode.save
      render json: {episodes: @episode }, status: :created, location: @episode
    else
      render json: @episode.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /episodes/1
  def update

    if @episode.update(episode_params)
      render json: { episodes: @episode }
    else
      render json: @episode.errors, status: :unprocessable_entity
    end

  end

  # DELETE /episodes/1
  def destroy
    @episode.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_episode
    @episode = Episode.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def episode_params
    params.require(:episode).permit(:release_date, :number, :title,
                                    :description, :production_code,
                                    :poster_path)
  end

end
