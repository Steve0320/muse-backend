class Movie < ApplicationRecord

  require 'faraday'

  validates :title, :description, presence: true

  def self.search(params)

    response = Faraday.get do |req|
      req.url 'https://api.themoviedb.org/4/search/movie'
      req.headers['Authorization'] = "Bearer #{ENV['tmdb_key']}"
      req.headers['Content-Type'] = 'application/json;charset=utf-8'
      req.params['query'] = params[:q]
    end

    json = JSON.parse(response.body)

    results = []

    json['results'].each do |result|
      movie = Movie.new
      movie.title = result['title']
      movie.description = result['overview']
      results << movie
    end

    return results

  end

end
