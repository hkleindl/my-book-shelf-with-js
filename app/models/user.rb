class User < ApplicationRecord
  has_many :ratings
  has_many :books, through: :ratings
end
