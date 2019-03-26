class Post < ApplicationRecord
    belongs_to :user 
    has_many :post_categories 
    has_many :categories, through: :post_categories


    def self.sort_posts_by_time
        sorted_posts = Post.all.sort_by { |post| post.created_at }.reverse
    end
end
