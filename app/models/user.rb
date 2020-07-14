class User < ApplicationRecord
    has_many :events
    has_many :locations, through: :events

    validates_presence_of :name, :email, :user_name, :password
    
end
