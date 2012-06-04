class Movie < ActiveRecord::Base
  def self.ratings
    Movie.select('DISTINCT rating').order('rating').collect { |result| result.rating }
  end
end
