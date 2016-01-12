# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.firs

until Organization.all.count >= 20 do
  Organization.create(name: Faker::App.name, website_url: Faker::Internet.url, description:Faker::Hipster.paragraphs)
end

until Project.all.count >= 50 do
  Project.create(
    title: Faker::App.name,
    vision: Faker::Hipster.sentence,
    need:Faker::Hipster.word,
    description:Faker::Hipster.paragraph,
    benefit:Faker::Hacker.noun,
    contact_name:Faker::Internet.user_name,
    contact_email:Faker::Internet.email,
    contact_phone:Faker::PhoneNumber.cell_phone,
    deadline:Faker::Time.between(DateTime.now-1, DateTime.now),
    organization_id: rand(21)
    )
end
