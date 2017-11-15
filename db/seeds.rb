
require 'faker'

Story.destroy_all
Contribution.destroy_all


20.times do |index|
  story = Story.create!(title: Faker::FamilyGuy.character, description: Faker::FamilyGuy.quote)
    story.contributions.create(username: "me",
                                            sentence: Faker::Lorem.sentence(20, false, 0).chop,
                                            image: Faker::Avatar.image)
end
