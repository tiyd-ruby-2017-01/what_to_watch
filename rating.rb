class Rating
  attr_reader :user_id, :movie_id, :score
  
  def initialize(user_id, movie_id, score)
    @user_id = user_id
    @movie_id = movie_id
    @score = score
  end
end
