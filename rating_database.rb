require 'csv'
require_relative 'rating'

class RatingDatabase
  def initialize()
    @ratings_by_movie_id = {}
    @ratings_by_user_id = {}
  end

  def load_from_file(file_path)
    CSV.foreach(file_path, col_sep: ' ', encoding: 'iso-8859-1') do |row|
      user_id = row[0].to_i
      movie_id = row[1].to_i
      score = row[2].to_f
      rating = Rating.new(user_id, movie_id, score)
      
      add_to_database(movie_id, rating, @ratings_by_movie_id)
      add_to_database(user_id, rating, @ratings_by_user_id)
    end
  end

  def add_to_database(id, value, database)
    database[id] = [] unless database.key? id
    database[id] << value
  end

  def find_by_movie_id(movie_id)
    @ratings_by_movie_id[movie_id]
  end

  def find_by_user_id(user_id)
    @ratings_by_user_id[user_id]
  end
end
