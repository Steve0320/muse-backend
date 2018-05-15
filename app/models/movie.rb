class Movie < ApplicationRecord

  require 'faraday'

  validates :title, :description, :tmdb_id, :imdb_id, presence: true
  validates :tmdb_id, :imdb_id, uniqueness: true

  def poster_path
    'https://image.tmdb.org/t/p/w500' + read_attribute(:poster_path)
  end

  def backdrop_path
    'https://image.tmdb.org/t/p/w500' + read_attribute(:backdrop_path)
  end

  # Find a movie record in TMDB by id
  def self.tmdb_lookup(id)

    # If result already exists in database, load from there


    # Otherwise, get info from TMDb
    response = Faraday.get do |req|
      req.url "https://api.themoviedb.org/3/movie/#{id}"
      req.headers['Content-Type'] = 'application/json;charset=utf-8'
      req.params['api_key'] = '7487a1aeaf17758c1b3f2d52f0c5d813'
    end

    return unmarshal_movie(JSON.parse(response.body))

  end

  # Translate a TMDB response to a movie object
  def self.unmarshal_movie(json)

    return Movie.new(
      backdrop_path: json['backdrop_path'],
      homepage: json['homepage'],
      tmdb_id: json['id'],
      imdb_id: json['imdb_id'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      description: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title']
    )

  end

end
