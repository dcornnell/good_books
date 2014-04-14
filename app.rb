require 'sinatra'

get "/main" do 
 	@good_books = GoodBooks.good_books
 	erb :"good_books/index"
 end

get "/error" do
	erb :"good_books/error"
end

get "/new" do
	erb :"good_books/new"
end

post "/add_book" do
	text = params[:book]
	if GoodBooks.add_new_book(text)
		redirect "/main"
	else 
		redirect "/error"
	end
end

class GoodBooks
	@@good_books = ["Slaughterhouse V" , "The Stranger" , "The Hobbit" , "Hyperion"]
	def initialize
	end

	def self.good_books
		@@good_books
	end

	def self.add_new_book(book)
		if book.length < 15
		@@good_books << book
	else
		return false
	end
	end
end