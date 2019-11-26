class OffersController < ApplicationController
  before_action :logged_in_entity,    only: [:create, :destroy]
  before_action :correct_user,        only: :destroy
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.paginate(page: params[:page])
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @offers = Offer.paginate(page: params[:page])
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
      @offer = current_user.offers.build(offer_params)
      @offer.image.attach(params[:offer][:image])
      if @offer.save
        flash[:success] = "Oferta Criada"
        redirect_to root_url
      else
      @feed_items = current_user.feed.paginate(page: params[:page])
       render 'static_pages/home'
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    flash[:success] = "Oferta apagada"
    redirect_to request.referrer || root_url
    end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:title, :content, :professional_activity, :type_of_contract, :salary, :image)
    end

    def correct_user
      @offer = current_user.offers.find_by(id: params[:id])
     redirect_to root_url if @offer.nil?
    end

end
