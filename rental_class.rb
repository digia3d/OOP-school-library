require 'json'
require './rental'
require './book'

class Rentals
  def self.create_a_rental(books, people, _list)
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s
    rental = Rental.new(date, books[book_id], people[person_id])
    puts 'Rental created successfully'
    sleep 0.65
    rental
  end

  def self.list_rentals_by_person_id(list)
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    rentals = []
    list.each do |rental|
      if rental.person.id == id
        rentals << rental
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
    puts 'No Rentals found' if rentals.empty?
    sleep 0.65
  end
end
