class Season < ApplicationRecord

  validates :number, presence: true

  belongs_to :show
  has_many :episodes, dependent: :destroy

  def links
    { episodes: Rails.application.routes.url_helpers.show_season_episodes_path(show_id, self) }
  end

  def self.unmarshal_tmdb(json)

    return Season.new(
      release_date: json['air_date'],
      title: json['name'],
      description: json['overview'],
      poster_path: json['poster_path'],
      number: json['season_number']
    )

  end

end
