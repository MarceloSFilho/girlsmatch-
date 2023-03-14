class User < ApplicationRecord
  has_many :student_mentorships, class_name: 'Mentorships', foreign_key: 'student_id'
  has_many :mentor_mentorships, class_name: 'Mentorships', foreign_key: 'mentor_id'
  has_many :skills, dependent: :destroy
  has_one_attached :photo
  accepts_nested_attributes_for :skills, update_only: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
