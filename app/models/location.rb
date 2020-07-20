class Location < ApplicationRecord
    has_many :events, dependent: :destroy
    has_many :users, through: :events

    validates_presence_of :name, :address, :city, :state, :zip
end
