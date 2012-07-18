require 'spec_helper'

describe MoviesController do
  describe 'Find similar movies' do
    let (:movie) { mock(Movie, :title => "Star Wars", :director => "George Lucas", :id => 1) }

    it 'should generate routing for similar movies' do
      Movie.stub(:find).with("1").and_return(movie)
      get :similar, :id => movie.id
    end
  end

  describe 'adding director to existing movie' do
      before :each do
        @movie = Movie.create(:title => "Star Wars")
        put :update, :id => @movie.id, :movie => {:director => 'Some Director'}
      end

      it 'should pass params to movie item when update director' do
        assigns[:movie].director.should == 'Some Director'
      end

      it 'should redirect to movie detail page when movie is updated' do
        response.should redirect_to(@movie)
      end
  end
end