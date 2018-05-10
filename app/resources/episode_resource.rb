class EpisodeResource < ApplicationResource

  attributes :episode_number

  has_one :season

end
