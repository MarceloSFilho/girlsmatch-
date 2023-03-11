class MentorshipsController < ApplicationController
  def index
    @mentors = User.where('mentor' => true)
  end

  def my_proposals
  end
end
