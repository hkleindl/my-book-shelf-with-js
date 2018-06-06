class AddBookIdToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :book_id, :integer
  end
end
