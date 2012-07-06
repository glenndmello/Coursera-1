require 'spec_helper'

describe Movie do
  before(:each) do
    @movie = Movie.new :title => 'Title'
  end

  it 'is valid with valid attributes' do
    @movie.should be_valid
  end

  it 'is not valid without a title' do
    @movie.title = nil
    @movie.should_not be_valid
  end
end