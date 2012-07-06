class Movie < ActiveRecord::Base
  validates_presence_of :title

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.with_similar_directors(director)
    Movie.where(:director => director)
  end
end
