class MentorshipsController < ApplicationController
  before_action :set_mentorship, only: :update

 def index
    if params[:query].present?
      @mentors = User.search_by_name_and_language(params[:query])
    else
      @mentors = User.where(mentor: true)
    end
  end

  def new
  end

  def create
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
  end

  def update
    # essa rota vai trocar o valor do boolean accepted -> responsabilidade do mentor
    @mentorship.update(accepted: :true)
    # tem que ter um chatroom.create find or create_by
    mentor = @mentorship.mentor
    student = @mentorship.student
    name = "#{mentor.username} x #{student.username}"
    @chatroom = Chatroom.find_or_create_by!(student: student, mentor: mentor, name: name)
    # e redirecionar pro chatroom
    redirect_to chatroom_path(@chatroom)
  end

  def destroy
    @mentorship = Mentorship.find(set_mentorship)
    @mentorship.destroy
    redirect_to my_proposals_path
  end

  private

  def set_mentorship
    @mentorship = Mentorship.find(params[:id])
  end


  def mentorship_params
    params.require(:mentorship).permit(:accepted, :completed, :photo)
  end

end
