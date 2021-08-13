# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

#  URI.open("http://tmdb.lewagon.com/movie/top_rated") {|f|
#     f.each_line {|line| p line}
# }

movies = JSON.parse(URI.open("http://tmdb.lewagon.com/movie/top_rated").read)['results']

movies.each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["vote_average"]}",
    rating: movie["vote_average"])
end