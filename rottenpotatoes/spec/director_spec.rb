require 'rails_helper'

require_relative '../app/models/movie.rb'

describe 'Has Director' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb" 
  end
  
  describe 'similar_movies' do
    it 'should be defined' do
      expect { Movie.similar_movies("Jeff") }.not_to raise_error
      expect { Movie.similar_movies("ThisIsNotARealName") }.not_to raise_error
    end

    it 'should return movies with correct director' do
      Movie.similar_movies("Jeff").each do |movie|
        expect(movie.director).to eq("Jeff")
      end
      Movie.similar_movies("John").each do |movie|
        expect(movie.director).not_to eq("Michael Bay")
      end
    end
  end
end