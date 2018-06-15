class Book < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :author
  has_many :book_genres
  has_many :genres, through: :book_genres

  accepts_nested_attributes_for :ratings
  accepts_nested_attributes_for :genres


  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
  end

  def author_name
    self.author ? self.author.name : nil
  end

  def genres_attributes=(genre_attributes)
    genre_attributes.values.each do |genre_attribute|
      genre = Genre.find_or_create_by(genre_attribute)
      self.genres << genre
    end
  end
end
