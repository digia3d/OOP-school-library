require_relative 'spec_helper'

describe 'Book' do
  before :each do
    @book = Book.new('Harry Potter', 'J.K.Rolings')
  end

  describe 'new' do
    it 'takes two parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe 'title' do
    it 'returns the correct title' do
      @book.title.should eql 'Harry Potter'
    end
  end

  describe 'author' do
    it 'returns the correct author' do
      @book.author.should eql 'J.K.Rolings'
    end
  end
end
