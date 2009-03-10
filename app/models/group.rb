class Group < ActiveRecord::Base
  has_many :events
  has_many :locations, :through => :events

  define_index do
    indexes name
    indexes events.description, :as => :event_descriptions
    indexes [locations.name, locations.address], :as => :location_addresses
  end
end
