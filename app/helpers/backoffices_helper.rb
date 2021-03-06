module BackofficesHelper


	def gravatar_for(user_entity, size: 80)
		gravatar_id = Digest::MD5::hexdigest(user_entity.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user_entity.name, class: "gravatar")
	end
end
