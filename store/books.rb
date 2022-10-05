require_relative '../book.rb'
require 'json'

module WriteBooks
  def write_books(books)
    json_books = []
    books.each do |book|
      json_books << {
        title: book.title,
        author: book.author
      }
    end
    File.write('./json-data/books.json', JSON.generate(json_books))
  end
end
