module SessionsHelper

def log_in(user_entity)
	session[:user_entity_id] = user_entity.id
end

def remember(user_entity)
user_entity.remember
cookies.permanent.signed[:user_entity_id] = user_entity.id
cookies.permanent[:remember_token] = user_entity.remember_token
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
def logged_in?
	!current_user.nil?
end

def log_out
	forget(current_user)
	session.delete(:user_entity_id)
	@currrent_user = nil
end

def forget(user_entity)
	user_entity.forget
	cookies.delete(:user_entity_id)
	cookies.delete(:remember_token)
end

end
