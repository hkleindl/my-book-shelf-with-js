class Book < ApplicationRecord
  has_many :ratings
  accepts_nested_attributes_for :ratings
  has_many :users, through: :ratings
  belongs_to :author
  has_many :book_genres
  has_many :genres, through: :book_genres

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
  end

  def author_name
    self.author ? self.author.name : nil
  end
end
