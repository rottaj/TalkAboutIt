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

jack = User.create(bio: "My name is Jack and I attend Flatiron!", user_name: "Rottaj" , status: "j chillin" , location: "Costa Rica" , email: "jack@gmail.jack", password: "password")
jackpost1 = Post.create(title: "The Greatest", content: "I am the greatest hooper of all time.", user_id: jack.id)
cat1 = Category.create(name: "sports")
PostCategory.create(category_id: cat1.id, post_id: jackpost1.id)

jackpost2 = Post.create(title: "Jimmy Johns", content: "Jimmy Johns makes me sick but I love it.", user_id: jack.id)
cat2 = Category.create(name: "food")
PostCategory.create(category_id: cat2.id, post_id: jackpost2.id)

jackpost3 = Post.create(title: "Flatiron", content: "Bobby and I are making some solid proggie.", user_id: jack.id)
cat3 = Category.create(name: "tech")
PostCategory.create(category_id: cat3.id, post_id: jackpost3.id)

reply1 = Reply.create(content: "Wow you probably shouldnt eat Jimmy Johns again.", post_id: jackpost2.id)

