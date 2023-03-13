class RemoveColumnsFromChatrooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :chatrooms, :student_id
    remove_column :chatrooms, :mentor_id
  end
end
