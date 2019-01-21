class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # validates_uniqueness_of :user_id, :scope => :book_id
  validates :stars, inclusion: { in: 1..5 }, allow_nil: false

  def user_name
    user = User.find_by(id: self.user_id)
    return user.username
  end
end
