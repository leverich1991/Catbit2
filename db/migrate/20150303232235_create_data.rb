class CreateData < ActiveRecord::Migration
  def change

    create_table :data do |t|

      t.integer :date
      t.integer :steps
      t.integer :steps_goal
      t.float :distance
      t.float :distance_goal
      t.integer :calories
      t.integer :calories_goal

      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :articles
  end
end
