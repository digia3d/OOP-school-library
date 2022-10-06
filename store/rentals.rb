require_relative '../rental'
require 'json'

module WriteRentals
  def write_rentals(rentals)
    json_rentals = []
    rentals.each do |rental|
      json_rentals << {
        date: rental.date,
        id: rental.person.id,
        title: rental.book.title,
        author: rental.book.author
      }
    end
    File.write('./rentals.json', JSON.generate(json_rentals))
  end
end
