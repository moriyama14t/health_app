class User < ApplicationRecord
  has_secure_password
  enum gender: { man: 1, woman: 2 }
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  
  def posts
    return Post.where(user_id: self.id)
  end
end