class ShowsController < ApplicationController

  before_action :set_show, only: %i[show update destroy]

  # GET /api/tv/shows
  def index
    @shows = Show.all
    render json: { shows: @shows }
  end

  # GET /api/tv/shows/1
  def show
    render json: { show: @show }, methods: [:links]
  end

  # POST /api/tv/shows
  def create

    # Default to loading from TMDb, but permit manual insertion
    @show = if params[:tmdb_id].present?
              Show.tmdb_lookup(params[:tmdb_id])
            else
              Show.new(show_params)
            end

    if @show.save
      render json: { shows: @show }, status: :created, location: @show, methods: [:links]
    else
      render json: @show.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /api/tv/shows/1
  def update

    if @show.update(show_params)
      render json: { shows: @show }, methods: [:links]
    else
      render json: @show.errors, status: :unprocessable_entity
    end

  end

  # DELETE /api/tv/shows/1
  def destroy
    @show.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_show
    @show = Show.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def show_params
    params.require(:show).permit(:backdrop_path, :homepage, :tmdb_id,
                                 :original_language, :original_title,
                                 :description, :popularity, :poster_path,
                                 :release_date, :runtime, :status, :title)
  end

end
