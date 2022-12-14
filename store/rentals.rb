require_relative '../rental'
require 'json'

module WriteRentals
  def write_rentals(rentals)
    json_rentals = []
    rentals.each do |rental|
      json_rentals << {
        date: rental.date,
        person_name: rental.person.name,
        person_age: rental.person.age,
        title: rental.book.title,
        author: rental.book.author
      }
    end
    File.write('json_data/rentals.json', JSON.generate(json_rentals))
  end
end
