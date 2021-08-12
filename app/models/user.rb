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


  validates :username, presence: true , uniqueness: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/, message: "英文字で入力してください。"}
  validates :profile, length: { maximum: 200 }
  validates :blog_url, allow_blank: true, format: { with: /\A#{URI::regexp(%w(http https))}\z/, message: "URL形式で入力してください。"}

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
