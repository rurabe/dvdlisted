module DvdsHelper
	def amazon_link(dvd)
		'http://www.amazon.com/dp/' + dvd.asin
	end
end
