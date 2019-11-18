module UserEntHelper

	#Returns the Gravatar for the given user.
def gravatar_for(user_ent, size: 80)
gravatar_id = Digest::MD5::hexdigest(user_ent.email.downcase)
gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
image_tag(gravatar_url, alt: user_ent.name, class: "gravatar")
end
end
