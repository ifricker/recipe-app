Rake::Task["db:drop"].invoke
Rake::Task["db:create"].invoke
Rake::Task["db:migrate"].invoke

# CREATE ADMIN
User.create!({
    username: "user",
    email: "user",
    password: "1234"
    })

# CREATE STANDARD USERS
40.times do
  User.create!({
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "1234"
    })
end

users = User.all

# CREATE RECIPES
# 40.times do
#   Recipe.create!({
#     title: Faker::Lorem.sentence,
#     summary: Faker::Lorem.paragraph,
#     image: Faker::Avatar.image
#     })
# end

# recipes = Recipe.all

# CREATE FAVORITES
# 100.times do
#   Favorite.create!({
#     user_id: rand(1..users.count),
#     recipe_id: rand(1..recipes.count)
#     })
# end

puts "SEEDING FINISHED"
puts "#{User.count} Users created"
# puts "#{Recipe.count} Recipes created"
# puts "#{Favorite.count} Favorites created"
