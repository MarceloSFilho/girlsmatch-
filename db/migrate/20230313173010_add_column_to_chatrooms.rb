class AddColumnToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :student, foreign_key: { to_table: :mentorships }
    add_reference :chatrooms, :mentor, foreign_key: { to_table: :mentorships }
  end
end
