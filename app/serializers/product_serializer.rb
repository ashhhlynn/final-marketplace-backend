class ProductSerializer < ActiveModel::Serializer
    attributes :title, :price, :id, :description, :sold, :buyer, :image_url, :user_id
    has_many :order_items
end