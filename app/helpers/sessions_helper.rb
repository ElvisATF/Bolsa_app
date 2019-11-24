module SessionsHelper

	def log_in(user_entity)
		session[:user_entity_id] = user_entity.id
	end

	def log_in_user(user)
		session[:user_id] = user.id
	end

	def remember(user_entity)
		user_entity.remember
		cookies.permanent.signed[:user_entity_id] = user_entity.id
		cookies.permanent[:remember_token] = user_entity.remember_token
	end

	def remember_user(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	def current_user_user
		if (user_id = session[:user_id])
				@current_user_user ||= User.find_by(id: user_id)
	       elsif (user_id = cookies.signed[:user_id])
	       		user = User.find_by(id: user_id)
	       if user && user.authenticated?(cookies[:remember_user_token])
		        log_in_user user
		        @current_user_user = user
			end
	  	end	
	end

	def current?(user)
		user && user == current_user_user
	end
	#def is_user
	 # !current_user_user.nil?
	#end
	#def is_entity
	 # !current_user.nil?
	#end
	def logged_in?
		!current_user.nil? || !current_user_user.nil?
	end
	#def log_out_user
	#	forget_user(current_user_user)
	#	session.delete(:user_id)
	#	@currrent_user_user = nil
	#end
	def log_out
	  	if !current_user.nil?
			forget(current_user)
			session.delete(:user_entity_id)
			@currrent_user = nil

	    elsif !current_user_user.nil?
		    forget_user(current_user_user)
			session.delete(:user_id)
			@currrent_user_user = nil
	   end
	end

	def forget_user(user)
		user.forget_user
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	def current_user
	    if (user_entity_id = session[:user_entity_id])
				@current_user ||= UserEntity.find_by(id: user_entity_id)
	        elsif (user_entity_id = cookies.signed[:user_entity_id])
	       		user_entity = UserEntity.find_by(id: user_entity_id)
	        if user_entity && user_entity.authenticated?(cookies[:remember_token])
	        	log_in user_entity
	        	@current_user = user_entity
		  	end
	    end	
	end

	def current_entity?(user_entity)
	 	user_entity && user_entity == current_user
	end

	def forget(user_entity)
		user_entity.forget
		cookies.delete(:user_entity_id)
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	def store_location
	   session[:forwarding_url] = request.original_url if request.get?
	end
end
