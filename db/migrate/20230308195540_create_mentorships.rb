class CreateMentorships < ActiveRecord::Migration[7.0]
  def change
    create_table :mentorships do |t|
      t.boolean :completed
      t.references :student, references: :users, null: false, foreign_key: { to_table: :users }
      t.references :mentor, references: :users, null: false, foreign_key: { to_table: :users }
      t.boolean :accepted

      t.timestamps
    end
  end
end
