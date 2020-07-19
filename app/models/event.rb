class Event < ApplicationRecord
    belongs_to :user
    belongs_to :location
    accepts_nested_attributes_for :location

    scope :event_group, -> { order("name") }

    validates_presence_of :name, :description, :month, :day, :year
end
