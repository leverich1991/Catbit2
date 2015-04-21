class AddGoalsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :input, :string
    add_column :users, :points, :integer
  end
end
