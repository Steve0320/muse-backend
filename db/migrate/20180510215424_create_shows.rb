class CreateShows < ActiveRecord::Migration[5.1]
  def change

    create_table :shows do |t|
      t.string :title, null: false
      t.string :description
      t.string :tvdb_id
      t.string :tvdb_link
      t.string :cover_url
      t.timestamps
    end

    add_index :shows, :tvdb_id, unique: true

    create_table :seasons do |t|
      t.integer :season_number, null: false
      t.timestamps
    end

    create_table :episodes do |t|
      t.integer :episode_number, null: false
      t.timestamps
    end

    # Show has many seasons and episodes
    add_reference :seasons, :show, foreign_key: true

    # Season has many episodes
    add_reference :episodes, :season, foreign_key: true

  end
end
