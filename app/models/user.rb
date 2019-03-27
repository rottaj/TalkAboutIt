class User < ApplicationRecord
    
    has_secure_password

    has_many :posts
    has_many :user_badges
    has_many :badges, through: :user_badges

    validates :user_name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :bio, length: { maximum: 200 }



end
