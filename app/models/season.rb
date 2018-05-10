class Season < ApplicationRecord

  validates :season_number, presence: true

  belongs_to :show
  has_many :episodes

end
