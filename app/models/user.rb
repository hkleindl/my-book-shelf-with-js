class User < ApplicationRecord
  has_many :ratings
  has_many :books, through: :ratings
  has_secure_password

  validates :username, presence: true, 
                       length: { maximum: 50 },
                       uniqueness: true
  validates :email, presence: true, 
                    length: { maximum: 100 },
                    uniqueness: true
  validates :password, presence: true,
                       length: { in: 6..20 }
end
