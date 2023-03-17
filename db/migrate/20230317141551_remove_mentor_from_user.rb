class RemoveMentorFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :mentor
  end
end
