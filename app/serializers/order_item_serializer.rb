class OrderItemSerializer < ActiveModel::Serializer
    attributes :order_id, :id, :price

   belongs_to :order
  end