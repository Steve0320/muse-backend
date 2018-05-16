class Show < ApplicationRecord

  require 'faraday'

  validates :title, :description, :tmdb_id, :imdb_id, presence: true
  validates :tmdb_id, :imdb_id, uniqueness: true

  has_many :seasons
  has_many :episodes

  def poster_path
    'https://image.tmdb.org/t/p/w500' + read_attribute(:poster_path)
  end

  def backdrop_path
    'https://image.tmdb.org/t/p/w500' + read_attribute(:backdrop_path)
  end

  # Find a tv show (with seasons and episodes) in TMDb
  def self.tmdb_lookup(id)

    # Load show info from TMDb
    response = Faraday.get do |req|
      req.url "https://api.themoviedb.org/3/tv/#{id}"
      req.headers['Content-Type'] = 'application/json;charset=utf-8'
      req.params['api_key'] = '7487a1aeaf17758c1b3f2d52f0c5d813'
    end

    show = JSON.parse(response.body)

    # Use append_to_response to reduce API queries
    season_appends = []

    show['seasons'].each do |season|
      season_number = season['season_number']
      season_appends << "season/#{season_number}"
    end

    show['seasons'] = []

    # Respect TMDb's limit of 20 appends per request
    season_appends.each_slice(20) do |batch|

      response = Faraday.get do |req|
        req.url "https://api.themoviedb.org/3/tv/#{id}"
        req.headers['Content-Type'] = 'application/json;charset=utf-8'
        req.params['api_key'] = '7487a1aeaf17758c1b3f2d52f0c5d813'
        req.params['append_to_response'] = batch.join(',')
      end

      json = JSON.parse(response.body)

      batch.each do |result|
        show['seasons'] << json[result]
      end

    end

    return show

  end

  def self.unmarshal_tmdb(json)

    return Show.new(
      backdrop_path: json['backdrop_path'],
      homepage: json['homepage'],
      tmdb_id: json['id'],
      original_language: json['original_language'],
      original_title: json['original_name'],
      description: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['first_air_date'],
      runtime: json['episode_run_time'],
      status: json['status'],
      title: json['name']
    )

  end

end
