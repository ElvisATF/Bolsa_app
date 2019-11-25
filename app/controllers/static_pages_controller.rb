class StaticPagesController < ApplicationController
 
def home
  	if logged_in?
  		@offer = current_user.offers.build 
  		@feed_items = current_user.feed.paginate(page:params[:page])
  end
end

  def new
  end
  
end
