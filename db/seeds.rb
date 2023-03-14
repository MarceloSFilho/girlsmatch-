
if Rails.env.development?
  Skill.destroy_all
  User.destroy_all
  Chatroom.destroy_all

 @joao = User.create(first_name: 'João', last_name: "pedro", email: 'joao@hotmail.com', password: '123456', mentor:true)
 @maria = User.create(first_name: 'Maria',last_name: "joaquina", email: 'maria@hotmail.com', password: '123456', mentor: true)
 1.times do
   Skill.create(language: Skill::LANGUAGES.sample, user_id: @joao.id)
 end
 1.times do
   Skill.create(language: Skill::LANGUAGES.sample, user_id: @maria.id)
 end
 end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

