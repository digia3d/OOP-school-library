require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
# rubocop:disable Metrics

class Rentals
  attr_reader :list

  def initialize
    @list = []
  end

  def create_a_rental(books, people)
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
    @list.push(rental)
    puts 'Rental created successfully'
    sleep 0.65
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @list.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    sleep 0.65
  end
end

class People
  attr_reader :list

  def initialize
    @list = []
  end

  def list_all_people
    puts 'There are no people yet! Kindly add a student or teacher.' if @list.empty?
    @list.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    sleep 0.65
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
    @list << student
    puts 'Student created successfully'
    sleep 0.75
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @list << teacher

    puts 'Teacher created successfully'
    sleep 0.65
  end
end

class Books
  attr_reader :list

  def initialize
    @list = []
  end

  def list_all_books
    puts 'There are no books yet! Kindly add books.' if @list.empty?

    @list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 0.65
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @list << book
    puts 'Book added successfully'
    sleep 0.65
  end
end

class App
  def initialize(people = People.new, books = Books.new, rentals = Rentals.new)
    @people = people
    @books = books
    @rentals = rentals
    @class = Classroom.new('Grade 10')
  end

  def start_app
    print 'Welcome To School Library App'
    sleep 0.65
  end

  def select_option(input)
    case input
    when '1'
      @books.list_all_books
    when '2'
      @people.list_all_people
    when '3'
      @people.create_a_person
    when '4'
      @books.create_a_book
    when '5'
      @rentals.create_a_rental(@books.list, @people.list)
    when '6'
      @rentals.list_rentals_by_person_id
    when '7'
      puts 'Thank you for using this app!'
    else
      puts 'Please enter a number between 1 and 7'
    end
  end
end
# rubocop:enable Metrics
