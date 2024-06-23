class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :sport
      t.integer :duration
      t.integer :calories_burned
      t.timestamps
    end
  end
end
