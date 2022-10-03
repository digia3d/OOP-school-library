require_relative 'app'

class Create
  def initialize
    @app = App.new
  end

  def select_option(choice)
    case choice
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_a_person
    when 4
      @app.create_a_book
    when 5
      @app.create_a_rental
    when 6
      @app.list_rentals_by_person_id
    else
      puts 'Invalid input'
    end
  end
end
