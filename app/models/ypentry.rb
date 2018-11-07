class Ypentry < ApplicationRecord

	validates :name, presence: true
	validates :phone, presence: true
	validates :address, presence: true
	validates :zip, presence: true
	validates :parish, presence: true

end
