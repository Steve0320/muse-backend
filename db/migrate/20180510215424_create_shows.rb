class CreateShows < ActiveRecord::Migration[5.1]
  def change

    create_table :shows do |t|
      t.string :backdrop_path
      t.string :homepage
      t.string :tmdb_id, null: false
      t.string :original_language
      t.string :original_title
      t.string :description
      t.float :popularity
      t.string :poster_path
      t.date :release_date
      t.integer :runtime
      t.string :status
      t.string :title, null: false
    end

    # Require TMDb ID to be unique
    add_index :shows, :tmdb_id, unique: true

    create_table :seasons do |t|
      t.date :release_date
      t.string :title
      t.string :description
      t.string :poster_path
      t.integer :number, null: false
      t.timestamps
    end

    create_table :episodes do |t|
      t.date :release_date
      t.integer :number, null: false
      t.string :title, null: false
      t.string :description
      t.string :production_code
      t.string :poster_path
      t.timestamps
    end

    # Show has many seasons
    add_reference :seasons, :show, foreign_key: true

    # Season has many episodes
    add_reference :episodes, :season, foreign_key: true

  end
end
