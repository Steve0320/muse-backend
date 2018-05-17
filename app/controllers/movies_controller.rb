class MoviesController < ApplicationController

  before_action :set_movie, only: %i[show update destroy]

  # GET /api/film/movies
  def index
    @movies = Movie.all
    render json: { movies: @movies }
  end

  # GET /api/film/movies/1
  def show
    render json: { movies: @movie }
  end

  # POST /api/film/movies
  def create

    # Default to loading from TMDb, but permit manual insertion
    @movie = if params[:tmdb_id].present?
               Movie.tmdb_lookup(params[:tmdb_id])
             else
               Movie.new(movie_params)
             end

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /api/film/movies/1
  def update

    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end

  end

  # DELETE /api/film/movies/1
  def destroy
    @movie.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def movie_params
    params.require(:movie).permit(:backdrop_path, :homepage, :tmdb_id, :imdb_id,
                                  :original_language, :original_title, :description,
                                  :popularity, :poster_path, :release_date, :runtime,
                                  :status, :tagline, :title)
  end

end
