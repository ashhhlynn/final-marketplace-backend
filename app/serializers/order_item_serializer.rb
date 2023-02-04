class OrderItemSerializer < ActiveModel::Serializer
    attributes :order_id, :id, :price
end