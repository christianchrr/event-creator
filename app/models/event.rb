class Event < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validates_presence_of :name, :description, :location, :month, :day, :year
end
