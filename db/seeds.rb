# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

movie_ids = [299536, 315635, 49026, 472027, 11, 181808, 140607, 348350, 181812, 330459, 1893, 1894, 1895]
show_ids = [19885, 63247, 456, 1403, 60708, 1399, 57243, 1396, 46671, 63639]

# Movie.create(movies)

movie_ids.each do |movie|
  puts "Saving movie id #{movie}"
  unless Movie.tmdb_lookup(movie).save
    puts "Failed to save #{movie}"
  end
end

show_ids.each do |show|
  puts "Saving tv id #{show}"
  unless Show.tmdb_lookup(show).save
    puts "Failed to save #{show}"
  end
end