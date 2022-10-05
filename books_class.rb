class Books

  def self.list_all_books(list)
    puts 'There are no books yet! Kindly add books.' if list.empty?

    list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 0.65
  end

  def self.create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts 'Book added successfully'
    sleep 0.65
    book
  end
end