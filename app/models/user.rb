class User < ApplicationRecord
    has_many :posts
    has_many :userbadges
    has_many :badges, through: :userbadges

<<<<<<< HEAD
    def verification
   		
    end
=======
    #validations
    validates :user_name, uniqueness: true
    validates :email, uniqueness: true
    validates :bio, length: { maximum: 200 }


>>>>>>> d1207acb82863e1739702b507820aa6d079df8ff
end
