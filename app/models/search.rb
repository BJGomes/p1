class Search < ApplicationRecord

	def self.most_searched
		select("searches.name, count(searches.name)")
		.joins("RIGHT JOIN ypentries ON searches.name = ypentries.name")
		.group("searches.name")
		.order("count DESC")
		.limit(3)
	end

end
