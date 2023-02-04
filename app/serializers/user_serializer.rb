class UserSerializer < ActiveModel::Serializer

    attributes :name, :email, :address, :password_digest, :created_at
    has_many :orders
  
  end