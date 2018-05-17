class Season < ApplicationRecord

  validates :number, presence: true

  belongs_to :show
  has_many :episodes, dependent: :destroy

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
