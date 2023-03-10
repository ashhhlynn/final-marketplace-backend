class User < ApplicationRecord
    has_many :orders, -> { where complete: true }
    has_many :products
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }
    validates :name, length: { maximum: 100 }
    validates :address, length: { maximum: 100 }
    validates :city, length: { maximum: 100 }
    validates :state, length: { maximum: 100 }
    validates :zip, length: { maximum: 6 }
end
