class Mentorship < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :mentor, class_name: 'User'
  has_one_attached :photo


  validates :student, uniqueness: { scope: :mentor, message: "Solicitação já enviada" }
end
