class Story < ActiveRecord::Base
  has_many :contributions
  validates :title, :presence => true

  scope :most_contributions, -> {(
    select("stories.id, stories.title, stories.description, count(contributions.id as contributions_count")
    .joins(:contributions)
    .group("stories.id")
    .order("contributions_count ASC")
    .limit(5)
    )}

    scope :title, -> (title_parameter) { where("title like ?", "%#{title_parameter}") }
end
