class ChangeDefaultValueColumnsMentorships < ActiveRecord::Migration[7.0]
  def change
    change_column :mentorships, :completed, :boolean, default: false
    change_column :mentorships, :accepted, :boolean, default: false
  end

  def up
    change_column :mentorships, :completed, false
    change_column :mentorships, :accepted, false
  end

  def down
    change_column :mentorships, :completed, nil
    change_column :mentorships, :accepted, false
  end
end
