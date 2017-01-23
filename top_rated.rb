require_relative 'rating_database'
require_relative 'movie_database'

def main
  ratings = RatingDatabase.new

  ratings.load_from_file('data/u.data')

  movies = MovieDatabase.new(ratings)

  movies.load_from_file('data/u.item')

  movie = movies.find_by_id(55)

  puts movies.top_rated
end

main if __FILE__ == $PROGRAM_NAME
