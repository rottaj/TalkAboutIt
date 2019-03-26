class User < ApplicationRecord
    has_many :posts
    has_many :userbadges
    has_many :badges, through: :userbadges

    def verification
   		
    end
end
