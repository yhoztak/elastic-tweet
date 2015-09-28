require 'elasticsearch/persistence'



class Area < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  # field :address
  # after_create: rake_job
  validates :latitude, uniqueness: { scope: [:latitude, :longitude,:radius] }

  # reverse_geocoded_by :latitude, :longitude,
  #   :address => :location
  #   after_validation :reverse_geocode

  # find existing value  
  def self.find_lat_lon(area)
    puts area.inspect
    area = Area.where(:latitude=>area.latitude, :longitude=>area.longitude,:radius=>area.radius)
      if(area!=nil)
        return area.first
      end
      return area    
  end
  
  def tweets
    
    
  end
  
  
end
