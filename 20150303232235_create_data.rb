class CreateData < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :data do |t|
      t.belongs_to :customer, index: true

      t.datetime :date
      t.integer :steps
      t.integer :steps_goal
      t.float :distance
      t.float :distance_goal
      t.integer :calories
      t.integer :calories_goal

      t.timestamps null: false
    end
  end
end
