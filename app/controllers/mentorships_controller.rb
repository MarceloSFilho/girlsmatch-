class MentorshipsController < ApplicationController
  before_action :set_mentorship, only: :update


  def index
    @mentors = User.where('mentor' => true)
  end

  def new
  end

  def create
    # criar requisição
    @mentorship = Mentorship.new
    @mentor = User.find(params[:user_id])
    @student = current_user
    @mentorship.mentor_id = @mentor.id
    @mentorship.student_id = @student.id
    if @mentorship.save
      redirect_to my_proposals_path
    else
      redirect_to profile_path, alert: "Solicitação já enviada"
    end
  end

  def my_proposals
    if current_user.student
      @mentorships = Mentorship.where(student: current_user)
    else
      @mentorships = Mentorship.where(mentor: current_user)
    end
    # se o current user for student ele só vai ver nome do mentor e o status do accepted
    # se o current user for mentor vai aparecer o botao de aceitar essa mentoria que update o acepted e redireciona pro link do chatroom -> e cria o chat room
  end

  def update
    # essa rota vai trocar o valor do boolean accepted -> responsabilidade do mentor
    @mentorship.update(accepted: :true)
    # tem que ter um chatroom.create find or create_by
    mentor = @mentorship.mentor
    student = @mentorship.student
    name = "#{mentor.username} x #{student.username}"
    @chatroom = Chatroom.create!(student: student, mentor: mentor, name: name)

    # e redirecionar pro chatroom
    redirect_to chatroom_path(@chatroom)
  end

  def completed
    @mentorship = Mentorship.find(set_mentorship)
    @mentorship.update([:completed])
    # o destroy muda o status de completed pra true
  end

  private

  def set_mentorship
    @mentorship = Mentorship.find(params[:id])
  end


  def mentorship_params
    params.require(:mentorship).permit(:accepted, :completed, :photo)
  end

end
