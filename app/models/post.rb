class Post < ApplicationRecord
    belongs_to :user 
    has_many :post_categories 
    has_many :categories, through: :post_categories
    has_many :replies

    validates :title, length: {maximum: 30}
    validates :content, length: {maximum: 250}

    def self.sort_posts_by_time
        sorted_posts = Post.all.sort_by { |post| post.created_at }.reverse
    end

    def self.sort_posts_by_category
        sorted_posts = Post.all.sort_by { |post| post.categories }
    end

    def self.sort_posts_by_user
        sorted_posts = Post.all.sort_by { |post| post.user_id }
    end
end



