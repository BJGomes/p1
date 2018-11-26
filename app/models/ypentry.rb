class Ypentry < ApplicationRecord

	validates :name, presence: true
	validates :phone, presence: true
	validates :address, presence: true
	validates :zip, presence: true
	validates :parish, presence: true

	scope :by_name,  -> (name) { where("name LIKE ?", "%{name}%") }
	scope :by_place, -> (place) { where("place LIKE ?", "%{place}%") }
	
	geocoded_by :address
	after_validation :geocode
	
	def full_address
		[parish, zip, address].compact.join(', ')
	end

	def self.by_name_or_place (name, place)
		if !name.blank? and !place.blank?
			where("name LIKE ? AND parish LIKE ?", '%'+name+'%', '%'+place+'%')
		elsif !name.blank?
			where("name LIKE ?", '%'+name+'%')
		elsif !place.blank?
			where("parish LIKE ?", '%'+place+'%')
		end
	end

end
