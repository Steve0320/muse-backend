class ShowResource < ApplicationResource

  attributes :title, :description, :tvdb_id, :tvdb_link

  has_many :seasons

end
