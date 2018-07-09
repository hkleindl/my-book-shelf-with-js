class Book < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :author
  has_many :book_genres
  has_many :genres, through: :book_genres

  validates :name, :author_name, presence: true

  accepts_nested_attributes_for :ratings
  accepts_nested_attributes_for :genres

  scope :highly_rated, -> { joins(:ratings).merge(Rating.group(:book_id).having('AVG(stars) > 4')) }
  scope :popular, -> { joins(:ratings).group(:id).order('COUNT(ratings.id) DESC').limit(10) }

  def average_star_rating
    self.ratings.average(:stars).round(1)    
  end

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
