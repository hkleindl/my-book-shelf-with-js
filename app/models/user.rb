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
  validates :password, length: { minimum: 6 },
                       allow_nil: true

  # validates :password, presence: true,
  #                      length: { in: 6..20 }                     

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email = auth_hash["info"]["email"]
    oauth_nickname = auth_hash["info"]["nickname"]
    where(email: oauth_email).first_or_create do |user|
      user.username = oauth_nickname
      user.password = SecureRandom.hex
    end
  end                     
end
