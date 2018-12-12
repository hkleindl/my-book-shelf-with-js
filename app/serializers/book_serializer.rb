class BookSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :author
end
