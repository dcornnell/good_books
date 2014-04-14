require 'sinatra'

get "/" do 
 	@good_books = GoodBooks.good_books
 	erb :"good_books/index"
 end

get "/error" do
	"That book sucks, im not gonna add it to my list!"
end

get "/addbook" do
	@good_books = GoodBooks.good_books
	erb :"good_books/new"
end

class GoodBooks
	@@good_books = ["Slaughterhouse V" , "The Stranger" , "The Hobbit" , "Hyperion"]
	def initialize
	end

	def self.good_books
		@@good_books
	end

	def self.add_new_book(book)
		@@good_books << book
	end
end