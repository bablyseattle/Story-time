class Contribution < ActiveRecord::Base
  belongs_to :story
  validates :username, :presence => true

  # validates :sentence,
  # presence: true,
  # length: {maximum: 10},
  # on: :create,
  # allow_nil: false
  #
  # scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)}
  scope :two_most_recent, -> { order(created_at: :desc).limit(2)}

end
