class RatingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :book_id, :user_name, :stars
  belongs_to :book
  belongs_to :user
end
