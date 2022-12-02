class Article < ApplicationRecord
    belongs_to :category
    belongs_to :console
    belongs_to :seller, class_name: "User"
    belongs_to :buyer, class_name: "User", optional: true
    has_many :carts
    has_many :comments, as: :commentable
    belongs_to :order, optional: true
end