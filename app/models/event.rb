class Event < ApplicationRecord
    belongs_to :user
    belongs_to :location
    accepts_nested_attributes_for :location

    scope :event_group, -> { order("name") }

    validates_presence_of :name, :description, :month, :day, :year

    def self.search(search)
        if search
            location = Location.find_by(name: search)
            if location
                self.where(location_id: location)
            else
                Event.all
            end
        else
            Event.all
        end
    end
    
end
