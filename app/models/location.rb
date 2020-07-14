class Location < ApplicationRecord
    has_many :events
    has_many :users, through: :events

    validates_presence_of :name, :address, :city, :state, :zip
end
