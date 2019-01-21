class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :average_star_rating
  belongs_to :author
  has_many :ratings
  has_many :users, through: :ratings
end
