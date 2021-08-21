class Post < ApplicationRecord

    mount_uploader :image, ImageUploader

    has_many :likes, class_name: "Like", foreign_key: "post_id", dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :comments, -> { order('created_at DESC') }, class_name: "Comment", foreign_key: "post_id", dependent: :destroy

    belongs_to :user

    validates :content, presence: true, length: {maximum:140}
    
end
