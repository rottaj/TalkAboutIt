class Badge < ApplicationRecord
    has_many :userbadges
    has_many :users, through: :userbadges
end
