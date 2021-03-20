class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :year, null: false
      t.string :slug, null: false
      t.string :imdbid
      t.string :genre
      t.text   :plot
      t.string :country

      t.timestamps
    end
  end
end
