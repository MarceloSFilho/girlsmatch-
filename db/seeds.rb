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
