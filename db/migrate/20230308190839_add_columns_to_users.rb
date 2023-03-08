class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :student, :boolean
    add_column :users, :mentor, :boolean
    add_column :users, :available, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
  end
end
