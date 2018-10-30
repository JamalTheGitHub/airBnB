class ListingsController < ApplicationController

  def show
    @listing = Listing.find(params[:id])
  end
  
  def index
    @listings = Listing.all
  end

  def new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to root_url
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :address, :price_per_day)
  end
end
