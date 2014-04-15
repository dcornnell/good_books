class CreateBooks < ActiveRecord::Migration
  def change
  	create_table :good_books do |t|
  		t.string :title
  		t.string :author
  		t.timestamps
  	end
  end
end
