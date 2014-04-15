require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///good_books.db"

post "/add_book" do
	good_book = GoodBooks.new
	good_book.title = params[:title]
	good_book.author = params[:author]
	good_book.save
	redirect :"/main"
end

get "/main" do 
 	@good_books = GoodBooks.all
 	erb :"good_books/index"
end

get "/error" do
	erb :"good_books/error"
end

get "/new" do
	erb :"good_books/new"
end

get"/good_books/:id/delete" do
	@good_books = GoodBooks.find(params[:id])
	 erb :"good_books/delete"
	end


get "/good_books/:id/edit" do
	@good_book = GoodBooks.find(params[:id])
	 erb :"good_books/edit"
	end

put '/good_books/:id/edit' do
	good_book = GoodBooks.find params[:id]
	good_book.update_attributes(params[:good_book])

	
	redirect :"/main"
end

 


delete '/good_books/:id/delete' do
	@good_books =GoodBooks.find params[:id]
	@good_books.destroy
		redirect :"/main"
end




class GoodBooks < ActiveRecord::Base
	@@good_books = ["Slaughterhouse V" , "The Stranger" , "The Hobbit" , "Hyperion"]
	

	def self.good_books
		@@good_books
	end

	def self.add_new_book(book)
		if book.length < 25
			@@good_books << book
		else
			return false
		end
	end
end