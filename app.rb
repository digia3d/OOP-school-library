require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
require_relative './books_class'
require_relative './rental_class'
require_relative './people_class'
require_relative 'read_data'
require_relative './store/books'
require_relative './store/people'
require_relative './store/rentals'
# rubocop:disable Metrics

class App
  include WriteRentals
  include WritePeople
  include WriteBooks
  include ReadData
  attr_accessor :books, :people, :rentals

  def initialize
    @people = read_people
    @books = read_books
    puts @people
    puts @books
    @rentals = []#read_rentals(@people, @books)
    
  end

  def start_app
    print 'Welcome To School Library App'
    sleep 0.65
  end

  def select_option(input)
    case input
    when '1'
      Books.list_all_books(books)
    when '2'
      People.list_all_people(people)
    when '3'
      @people << People.create_a_person
    when '4'
      @books << Books.create_a_book
    when '5'
      @rentals << Rentals.create_a_rental(@books, @people, @rentals)
    when '6'
      Rentals.list_rentals_by_person_id(@rentals)
    when '7'
      write_books(@books)
      write_people(@people)
      write_rentals(@rentals)
      puts 'Thank you for using this app!'
    end
  end
end
# rubocop:enable Metrics
