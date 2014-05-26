class Book
  attr_accessor :author
  attr_reader :title
  attr_writer :comments
  def initialize(author, title)
    @author = author
    @title = title
    @comments = []
  end
end

book = Book.new("Chuck Palahniuk", "Fight Club")

p book

puts "#{book.title} #{book.author}"



s = "Hello: I`m a l33t programmer!!"

p s.split(/[^a-zA-Z]/).reject{|e| e == "I"}
p s.scan(/[a-zA-Z]/).reject{|e| e == "I" || e.empty?}
p s.split(/[^a-z^A-Z]/).reject{|e| e == "I"}
p s.split(/[^a-zA-Z]/).reject{|e| e == "I" || e.empty?}
