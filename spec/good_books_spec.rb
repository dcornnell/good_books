require 'rspec'
require './app.rb'

describe GoodBooks do 
	it 'should contain some books' do
		GoodBooks.good_books.should_not be_empty
	end

	it 'should add a new book' do
		first_count = GoodBooks.good_books.count
		book = "Cryptonomicon"
		GoodBooks.add_new_book(book)
		second_count =GoodBooks.good_books.count
		second_count.should > first_count
	end
end