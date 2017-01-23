require 'csv'
require_relative 'movie'

class MovieDatabase
  def initialize(ratings)
    @movies = {}
    @ratings = ratings
  end

  def load_from_file(file_path)
    CSV.foreach(file_path, col_sep: '|', encoding: 'iso-8859-1') do |row|
      movie_id = row[0].to_i
      title = row[1]
      ratings = @ratings.find_by_movie_id(movie_id)
      movie = Movie.new(movie_id, title, ratings)
      @movies[movie_id] = movie
    end
  end

  def find_all
    @movies.values
  end

  def find_by_id(movie_id)
    @movies[movie_id]
  end

  def enough_ratings(minimum_ratings)
    @movies.reject { |movie_id, movie| movie.ratings.length < minimum_ratings }
  end

  def top_rated(minimum_ratings=100, how_many=20)
    movies = enough_ratings(minimum_ratings)
    movies = movies.sort_by { |movie_id, movie| -movie.average_rating}
    movies.map { |id, movie| movie }.take(how_many)
  end
end
