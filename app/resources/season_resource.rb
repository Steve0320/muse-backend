class SeasonResource < ApplicationResource

  attributes :season_number

  has_one :show
  has_many :episodes

end
