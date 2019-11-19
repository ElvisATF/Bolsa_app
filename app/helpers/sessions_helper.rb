module SessionsHelper

def log_in(user_ent)
	session[:user_ent_id] = user_ent.id
end

def remember(user_ent)
user_ent.remember
cookies.permanent.signed[:user_ent_id] = user_ent.id
cookies.permanent[:remember_token] = user_ent.remember_token
end

def current_user
	  if (user_ent_id = session[:user_ent_id])
		@current_user ||= UserEnt.find_by(id: user_ent_id)
      elsif (user_ent_id = cookies.signed[:user_ent_id])
      user_ent = UserEnt.find_by(id: user_ent_id)
      if user_ent && user_ent.authenticated?(cookies[:remember_token])
      log_in user_ent
      @current_user = user_ent
	end
  end	
end
def logged_in?
	!current_user.nil?
end

def log_out
	forget(current_user)
	session.delete(:user_ent_id)
	@currrent_user = nil
end

def forget(user_ent)
	user_ent.forget
	cookies.delete(:user_ent_id)
	cookies.delete(:remember_token)
end

end
