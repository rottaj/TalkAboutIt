class Post < ApplicationRecord
    belongs_to :user 
    has_many :post_categories 
    has_many :categories, through: :post_categories

    validates :title, length: {maximum: 30}
    validates :content, length: {maximum: 250}
end
