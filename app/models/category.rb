class Category < ApplicationRecord
    has_many :post_categories
    has_many :posts, through: :post_categories
    validates :name, uniqueness: true

    def self.sort_by_posts
        sorted_categories = Category.all.sort_by{ |category| category.posts.count}.reverse
    end
end
