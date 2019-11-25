module OffersHelper

	def gravatar_for(offer, size: 80)
	
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: offer.name, class: "gravatar")
	end

end
