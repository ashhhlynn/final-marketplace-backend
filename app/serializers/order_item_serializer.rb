class OrderItemSerializer < ActiveModel::Serializer
    attributes :id, :price, :product_id, :order_id
    belongs_to :product
    belongs_to :order
end