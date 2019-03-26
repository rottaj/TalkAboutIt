class Badge < ApplicationRecord
    has_many :userbadges
    has_many :users, through: :userbadges

    #validations
    validates :name, uniqueness: true
    validates :name, length: { in: 2...20 }

end
