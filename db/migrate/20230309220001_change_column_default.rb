class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :available, :boolean, default: true
  end

  def up
    change_column_default :users, :available, true
  end

  def down
    change_column_default :users, :available, nil
  end
end
