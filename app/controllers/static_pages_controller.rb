class StaticPagesController < ApplicationController
	 
	def home
		#@offer = current_user.offers.build
		#@feed_items = current_user.feed.paginate(page: params[:page])
	end
 
 	def index_offer
   		 @offers = Offer.paginate(page: params[:page])
  	end


  	def new
 	 end
  
end
