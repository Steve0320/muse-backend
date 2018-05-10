class CreateMovies < ActiveRecord::Migration[5.1]
  def change

    create_table :movies do |t|
      t.string :title, null: false
      t.string :description
      t.string :imdb_id
      t.string :imdb_link
      t.string :cover_url
      t.timestamps
    end

    add_index :movies, :imdb_id, unique: true

  end
end
