class MentorshipsController < ApplicationController
  def index
    @mentors = User.where('mentor' => true)
  end

  def new
    @mentorship = Mentorship.new
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
      render :new, status: :unprocessable_entity
    end
    # para criar a mentoria o estudante faz uma requisição(proposal) para o mentor -> responsabilidade do botão submmi
  end

  def my_proposals

  end

  def update
    # essa rota vai trocar o valor do boolean accepted
    # tem que ter um chatroom.create find or create_by
    # e redirecionar pro chatroom
  end

  def destroy
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
