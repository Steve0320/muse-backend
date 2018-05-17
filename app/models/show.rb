class Show < ApplicationRecord

  require 'faraday'

  validates :title, :description, :tmdb_id, presence: true
  validates :tmdb_id, uniqueness: true

  has_many :seasons, dependent: :destroy

  def poster_path
    'https://image.tmdb.org/t/p/w500' + read_attribute(:poster_path)
  end

  def backdrop_path
    'https://image.tmdb.org/t/p/w500' + read_attribute(:backdrop_path)
  end

  # Find a tv show (with seasons and episodes) in TMDb
  # Number of api requests = 1 + ceil(seasons/20)
  # Should run in O(n) where n = total number of episodes
  def self.tmdb_lookup(id)

    # Load show info from TMDb
    response = Faraday.get do |req|
      req.url "https://api.themoviedb.org/3/tv/#{id}"
      req.headers['Content-Type'] = 'application/json;charset=utf-8'
      req.params['api_key'] = '7487a1aeaf17758c1b3f2d52f0c5d813'
    end

    show = JSON.parse(response.body)
    show_obj = Show.unmarshal_tmdb(show)

    # Use append_to_response to reduce API queries
    season_appends = []

    # Figure out append links
    show['seasons'].each do |season|
      season_number = season['season_number']
      season_appends << "season/#{season_number}"
    end

    # Respect TMDb's limit of 20 appends per request
    season_appends.each_slice(20) do |batch|

      response = Faraday.get do |req|
        req.url "https://api.themoviedb.org/3/tv/#{id}"
        req.headers['Content-Type'] = 'application/json;charset=utf-8'
        req.params['api_key'] = '7487a1aeaf17758c1b3f2d52f0c5d813'
        req.params['append_to_response'] = batch.join(',')
      end

      json = JSON.parse(response.body)

      batch.each do |season_key|

        season_obj = Season.unmarshal_tmdb(json[season_key])
        show_obj.seasons << season_obj

        json[season_key]['episodes'].each do |episode|
          season_obj.episodes << Episode.unmarshal_tmdb(episode)
        end

      end

    end

    return show_obj

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
      runtime: json['episode_run_time'][0],
      status: json['status'],
      title: json['name']
    )

  end

end
