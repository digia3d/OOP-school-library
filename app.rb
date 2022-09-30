require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @class = Classroom.new('Grade 10')
  end

  def start_app
    print 'Welcome To School Library App'
    sleep 0.65
    menu
  end

  def list_all_books
    puts 'There are no books yet! Kindly add books.' if @books.empty?

    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 0.65
    menu
  end

  def list_all_people
    puts 'There are no people yet! Kindly add a student or teacher.' if @people.empty?
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    sleep 0.65
    menu
  end

  def create_a_person
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp
    case option
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      puts 'Invalid input. Kindly type 1 or 2'
    end
  end

  def create_a_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    student = Student.new(age, @class, name, parent_permission: parent_permission)
    @people << student
    puts 'Student created successfully'
    sleep 0.75
    menu
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @people << teacher

    puts 'Teacher created successfully'
    sleep 0.65
    menu
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book added successfully'
    sleep 0.65
    menu
  end
end

def create_a_rental
  puts 'Select a book from the following list by number'
  @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title} Author: #{book.author}" }
  book_index = gets.chomp.to_i

  puts 'Select a person from the following list by number (not id)'
  @people.each_with_index { |person, index| puts "#{index}) ID:#{person.id} Name: #{person.name} Age:#{person.age}" }
  person_index = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp
  rental = Rental.new(date, @people[person_index], @books[book_index])
  @rentals.push(rental)
  puts 'Rental created successfully'
  sleep 0.65
  menu
end

def list_rentals_by_person_id
  puts 'List of all rentals by person id'
  puts 'Select a person from the following list by ID'
  @people.each { |person| puts "ID: #{person.id} Name: #{person.name} Age:#{person.age}" }
  id = gets.chomp.to_i
  puts 'Rentals:'
  @rentals.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}" if rental.person.id == id
  end
  sleep 0.65
  menu
end
