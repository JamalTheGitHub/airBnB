class ListingsController < ApplicationController

  def show
    @listing = Listing.find(params[:id])
  end
  
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to root_url
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :address, :price_per_day, :description, :amenities, :guests, :bedrooms, :beds, :sleeping_arrangements, :baths)
  end
end
