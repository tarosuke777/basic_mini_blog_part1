class Post < ApplicationRecord

    has_many :likes, class_name: "Like", foreign_key: "post_id", dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    belongs_to :user

    validates :content, presence: true, length: {maximum:140}
    
end
