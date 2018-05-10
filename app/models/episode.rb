class Episode < ApplicationRecord

  validates :episode_number, presence: true

  belongs_to :show
  belongs_to :season

end
