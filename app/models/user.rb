class User < ApplicationRecord
    has_many :posts
    has_many :userbadges
    has_many :badges, through: :userbadges

    def verification
   		
    end
    #validations
    validates :user_name, uniqueness: true
    validates :email, uniqueness: true
    validates :bio, length: { maximum: 200 }


end
