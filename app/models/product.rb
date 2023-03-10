class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    belongs_to :user
    validates :image_url, format: {with: /\.(png|jpg)\Z/i}
    validates :description, length: { maximum: 170 }
    validates :title, length: { maximum: 50 }
    validates :price, length: { maximum: 12 }
end 
