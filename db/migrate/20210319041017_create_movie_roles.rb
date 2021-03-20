class CreateMovieRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_roles do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true
      t.string :role

      # Prevent new movie_roles records from passing the validations when checked
      # at the same time before being written
      t.index [:movie_id, :person_id, :role], unique: true

      t.timestamps
    end
  end
end
