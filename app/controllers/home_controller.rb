class HomeController < ApplicationController
  def index
    @users = User.order(:name).page(params[:page])
    @listings = if params[:tag]
      Listing.tagged_with(params[:tag])
    else
    @listings = Listing.all
    end
  end
end
