class Episode < ApplicationRecord

  validates :number, :title, presence: true

  belongs_to :season

  def self.unmarshal_tmdb(json)

    return Episode.new(
      release_date: json['air_date'],
      number: json['episode_number'],
      title: json['name'],
      description: json['overview'],
      production_code: json['production_code'],
      poster_path: json['still_path']
    )

  end

end
