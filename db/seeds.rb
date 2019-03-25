# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Category.destroy_all
PostCategory.destroy_all

swag = User.create(bio: "swagger", user_name: "swaggerMcjagger" , status: "swaggy" , location: "Costa Rica" , email: "swag@gmail.swag", password_digest: "swagasdfasrfawefasdfa")
p1 = Post.create(title: "swag", content: "swag", user_id: swag.id)
sport1 = Category.create(name: "sports")
PostCategory.create(category_id: sport1.id, post_id: p1.id)
