module SessionsHelper

def log_in(user_ent)
	session[:user_ent_id] = user_ent.id
end

def current_user
	if session[:user_ent_id]
		@current_user ||= UserEnt.find_by(id: session[:user_ent_id])
	end
  end	

def logged_in?
	!current_user.nil?
end

def log_out
	session.delete(:user_ent_id)
	@currrent_user = nil
end

end
