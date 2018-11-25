class Ypentry < ApplicationRecord

	validates :name, presence: true
	validates :phone, presence: true
	validates :address, presence: true
	validates :zip, presence: true
	validates :parish, presence: true
	
	geocoded_by :address
	after_validation :geocode
	
	def full_address
		[parish, zip, address].compact.join(', ')
	end

end
