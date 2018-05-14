class MoviesController < ApplicationController

  before_action :set_movie, only: %i[show update destroy]

  # GET /film/movies
  def index
    @movies = Movie.all
    render json: { movies: @movies }
  end

  # GET /film/movies/1
  def show
    render json: { movies: @movie }
  end

  # POST /film/movies
  def create

    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /film/movies/1
  def update

    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end

  end

  # DELETE /film/movies/1
  def destroy
    @movie.destroy
  end

  # GET /film/search
  def search
    render json: { movies: Movie.search(search_params) }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def movie_params
    params.fetch(:movie, {})
  end

  def search_params
    params.permit(:q)
  end

end
