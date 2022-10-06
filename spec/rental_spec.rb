require 'spec_helper'

describe 'Rental' do
  before :each do
    @person = Student.new(22, 'Daki', 'Grade 10', parent_permission: true)
    @book = Book.new('Harry Potter', 'J.K.Rolings')
    @rental = Rental.new('6.10.2022', @book, @person)
  end

  it 'should return the title of the rented book' do
    @person.rentals.each do |rental|
      puts rental
      expect(rental.book.title).to eq('Harry Potter')
    end
  end

  it 'should return the date of the rental book' do
    @person.rentals.each do |rental|
      expect(rental.date).to eq('6.10.2022')
    end
  end
end
