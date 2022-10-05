class Book
  attr_accessor :id, :title, :author
  attr_reader :rentals

  def initialize(id, title, author)
    @id = id || Random.random(1...1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
