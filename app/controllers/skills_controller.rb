class SkillsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    if @skill.save
      redirect_to profile_path, notice: "#{@skill.language} added with success!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    if @skill.destroy
      flash[:notice] = "#{@skill.language} removed"
      redirect_to profile_path
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:language)
  end
end
