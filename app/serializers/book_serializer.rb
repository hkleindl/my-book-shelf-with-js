class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :average_star_rating
  belongs_to :author
end
