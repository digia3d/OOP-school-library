require_relative './rental'
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require 'json'

module ReadData
  def read_books
    return [] unless File.exist?('json_data/books.json')

    json_books = File.open('json_data/books.json', 'r') { |file| file.readline }
    books = JSON.parse(json_books)
    books = books.map do |book|
      Book.new(book['title'], book['author'])
    end
    books
  end

  def read_people
    return [] unless File.exist?('json_data/people.json')

    json_people = File.open('json_data/people.json', 'r') { |file| file.readline }
    people = JSON.parse(json_people)
    people = people.map do |person|
      if (person['json_class'] == 'Student')
        classroom = Classroom.new(person['classroom'])
        student = Student.new(
          person['age'],
          classroom,
          person['name'],
          person['parent_permission']
        )
        student
      else
        Teacher.new(
          person['specialization'],
          person['age'],
          person['name']
        )
      end
    end
  end

  def read_rentals(people, books)
    return [] unless File.exist?('json_data/rentals.json')

    json_rentals = File.open('json_data/rentals.json', 'r') { |file| file.readline }
    rentals = JSON.parse(json_rentals)
    rentals = rentals.map do |rental|
      person = people.find { |person| person.name == rental['person_name'] && person.age == rental['person_age']}
      book = books.find { |book| book.title == rental['title'] && book.author == rental['author'] }
      Rental.new(rental['date'], book, person)
    end
  end
end
