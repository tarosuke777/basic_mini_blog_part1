class Article < ApplicationRecord

    belongs_to :owner, class_name: "User"

    validates :content, presence: true, length: {maximum:140}
end
