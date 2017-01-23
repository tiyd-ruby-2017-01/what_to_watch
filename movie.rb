class Movie
  attr_reader :id, :title, :ratings

  def initialize(id, title, ratings)
    @id = id
    @title = title
    @ratings = ratings
  end

  def average_rating
    sum = 0
    @ratings.each do |rating|
      sum += rating.score
    end

    number_of_ratings = @ratings.length

    sum / number_of_ratings
  end

  def to_s
    "#{@title} #{average_rating}"
  end
end
