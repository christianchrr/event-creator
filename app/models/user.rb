class User < ApplicationRecord
    has_many :events
    has_many :locations, through: :events
    has_secure_password

    validates_presence_of :name, :email, :password
    validates :email, uniqueness: true 
end
