class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :validatable

  has_many :created_articles, class_name: "Article", foreign_key: "user_id", dependent: :destroy
  has_many :relationships

  validates :username, format: { with: /\A[a-zA-Z]+\z/, message: "英文字のみが使えます" }, length: {maximum: 20}, presence: true 
  validates :profile, length: {maximum: 200}

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
