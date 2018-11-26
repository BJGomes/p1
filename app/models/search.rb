class Search < ApplicationRecord

	def self.most_searched
		select("ypentries.name, count(*)")
		.joins("RIGHT JOIN ypentries ON searches.name = ypentries.name")
		.group("ypentries.name")
		.order("count DESC")
		.limit(3)
	end

end
