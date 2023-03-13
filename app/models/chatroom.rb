class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :student, class_name: 'User'
  belongs_to :mentor, class_name: 'User'
end
