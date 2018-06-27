class CreateWorkoutposts < ActiveRecord::Migration[5.1]
  def change
    create_table :workoutposts do |t|
      t.string :mood
      t.string :length
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :workoutposts, [:user_id, :created_at]

  end
end
