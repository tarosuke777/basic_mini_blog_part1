class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :validatable

  has_many :created_posts, class_name: "Post", foreign_key: "user_id", dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :likes, class_name: "Like", foreign_key: "user_id", dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments, class_name: "Comment", foreign_key: "user_id", dependent: :destroy

  validates :username, uniqueness: true, length: { maximum: 20 }, format: /\A[a-zA-Z]+\z/
  validates :profile, length: { maximum: 200 }
  validates :blog_url, allow_blank: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :email, format: URI::MailTo::EMAIL_REGEXP

  def email_required? 
    false 
  end

  def email_changed? 
    false 
  end

  def will_save_change_to_email?
    false
  end

end
