class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :ratings
  has_many :books, through: :ratings
end
