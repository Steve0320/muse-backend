class CreateMovies < ActiveRecord::Migration[5.1]
  def change

    create_table :movies do |t|
      t.string :backdrop_path
      t.string :homepage
      t.string :tmdb_id, null: false
      t.string :imdb_id, null: false
      t.string :original_language
      t.string :original_title
      t.string :description
      t.float :popularity
      t.string :poster_path
      t.date :release_date
      t.integer :runtime
      t.string :status
      t.string :tagline
      t.string :title, null: false
      t.timestamps
    end

    add_index :movies, :tmdb_id, unique: true
    add_index :movies, :imdb_id, unique: true

  end
end
