class RemoveUserColumn < ActiveRecord::Migration[5.0]
  def up
    remove_column :questions, :user_id
    remove_column :answers, :user_id
  end

  def down
    add_column :questions, :user_id, :integer
    add_column :answers, :user_id, :integer
  end
end
