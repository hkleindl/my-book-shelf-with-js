class Author < ApplicationRecord
  has_many :books
  has_many :genres, through: :books

  scope :the_most_books, -> { joins(:books).group(:id).order('COUNT(books.id) DESC').limit(1) }
end

