class Show < ApplicationRecord

  validates :title, presence: true

  has_many :seasons
  has_many :episodes

end
