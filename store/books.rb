require_relative '../book'
require 'json'

module WriteBooks
  def write_books(books)
    data = books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end
    File.write('json_data/books.json', JSON.generate(data))
  end
end
