# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#movies = [
#  {
#    title: 'The Lord of the Rings: The Fellowship of the Ring',
#    description: 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.',
#    imdb_id: 'tt0120737',
#    imdb_link: 'https://www.imdb.com/title/tt0120737/',
#    cover_url: 'https://ia.media-imdb.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SY999_CR0,0,673,999_AL_.jpg'
#  },
#  {
#    title: 'The Lord of the Rings: The Two Towers',
#    description: "While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron's new ally, Saruman, and his hordes of Isengard.",
#    imdb_id: 'tt0167261',
#    imdb_link: 'https://www.imdb.com/title/tt0167261/',
#    cover_url: 'https://ia.media-imdb.com/images/M/MV5BMDY0NmI4ZjctN2VhZS00YzExLTkyZGItMTJhOTU5NTg4MDU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY268_CR1,0,182,268_AL_.jpg'
#  },
#  {
#    title: 'The Lord of the Rings: The Return of the King',
#    description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
#    imdb_id: 'tt0167260',
#    imdb_link: 'https://www.imdb.com/title/tt0167260/',
#    cover_url: 'https://ia.media-imdb.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg'
#  },
#  {
#    title: 'Shrek',
#    description: 'After his swamp is filled with magical creatures, Shrek agrees to rescue Princess Fiona for a villainous lord in order to get his land back.',
#    imdb_id: 'tt0126029',
#    imdb_link: 'https://www.imdb.com/title/tt0126029/',
#    cover_url: 'https://ia.media-imdb.com/images/M/MV5BOGZhM2FhNTItODAzNi00YjA0LWEyN2UtNjJlYWQzYzU1MDg5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg'
#  },
#  {
#    title: 'Scott Pilgrim vs. the World',
#    description: "Scott Pilgrim must defeat his new girlfriend's seven evil exes in order to win her heart.",
#    imdb_id: 'tt0446029',
#    imdb_link: 'https://www.imdb.com/title/tt0446029/',
#    cover_url: 'https://ia.media-imdb.com/images/M/MV5BMTkwNTczNTMyOF5BMl5BanBnXkFtZTcwNzUxOTUyMw@@._V1_UX182_CR0,0,182,268_AL_.jpg'
#  }
#]

movie_ids = [299536, 315635, 49026, 472027, 11, 181808, 140607, 348350, 181812, 330459, 1893, 1894, 1895]

shows = [
  {
    title: 'Daredevil',
    description: 'Matt Murdock, with his other senses superhumanly enhanced, fights crime as a blind lawyer by day, and vigilante by night.',
    cover_url: 'https://ia.media-imdb.com/images/M/MV5BNzUwMDEyMTIxM15BMl5BanBnXkFtZTgwNDU3OTYyODE@._V1_UX182_CR0,0,182,268_AL_.jpg'
  },
  {
    title: 'Futurama',
    description: "Fry, a pizza guy, is accidentally frozen in 1999 and thawed out New Year's Eve 2999",
    cover_url: 'https://ia.media-imdb.com/images/M/MV5BNzA2ZDk2ZTUtMWU2Yi00NDVmLTk1ODEtMmFmMjQyNWYzODI0XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UX182_CR0,0,182,268_AL_.jpg'
  },
  {
    title: 'Altered Carbon',
    description: 'Set in a future where consciousness is digitized and stored, a prisoner returns to life in a new body and must solve a mind-bending murder to win his freedom.',
    cover_url: 'https://ia.media-imdb.com/images/M/MV5BMjQyOTE4NjE0M15BMl5BanBnXkFtZTgwMzcxMzY1NDM@._V1_UX182_CR0,0,182,268_AL_.jpg'
  },
  {
    title: 'Westworld',
    description: 'Set at the intersection of the near future and the reimagined past, explore a world in which every human appetite can be indulged without consequence.',
    cover_url: 'https://ia.media-imdb.com/images/M/MV5BMjM2MTA5NjIwNV5BMl5BanBnXkFtZTgwNjI2OTMxNTM@._V1_UX182_CR0,0,182,268_AL_.jpg'
  },
  {
    title: 'Stranger Things',
    description: 'When a young boy disappears, his mother, a police chief, and his friends, must confront terrifying forces in order to get him back.',
    cover_url: 'https://ia.media-imdb.com/images/M/MV5BMjUwMDgzOTg3Nl5BMl5BanBnXkFtZTgwNTI4MDk5MzI@._V1_UX182_CR0,0,182,268_AL_.jpg'
  }
]

# Movie.create(movies)

movie_ids.each do |movie|
  puts "Saving movie id #{movie}"
  unless Movie.tmdb_lookup(movie).save
    puts "Failed to save #{movie}"
  end
end

Show.create(shows)

Show.first.seasons = Season.create([{season_number: 1}, {season_number: 2}, {season_number: 3}])
