class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :student, references: :users, null: false, foreign_key: { to_table: :users }
      t.references :mentor, references: :users, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
