class User < ApplicationRecord
    has_many :orders, -> { where complete: true }
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }
end
