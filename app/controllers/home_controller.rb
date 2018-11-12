class HomeController < ApplicationController
  def index
    # @listings = Listing.all
    # @listings = Listing.order('title').page(params[:page]).per(9)
    @users = User.order(:name).page(params[:page])
    @listings = Listing.filter(params.slice(:bedrooms)).page(params[:page]).per(9)
    if params[:tag]
      @listings = params[:tag]
      Listing.tagged_with(params[:tag])
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :address, :price_per_day, :description, :amenities, :guests, :bedrooms, :beds, :sleeping_arrangements, :baths, :tag_list, {pictures: []})
  end
end
