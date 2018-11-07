class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def show
    @reservation = Reservation.new
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
  end

  def update
    if @listing.update(listing_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @listing.destroy
    redirect_to back #method comes back from applicationController
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :address, :price_per_day, :description, :amenities, :guests, :bedrooms, :beds, :sleeping_arrangements, :baths, :tag_list, {pictures: []})
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def authorize_user
    # user is redirected UNLESS they are the property owner OR a moderator/superadmin
    if current_user.id != @listing.user_id && current_user.customer?
      redirect_to root_url, notice: "You're not authorized to do that."
    end
  end
end
