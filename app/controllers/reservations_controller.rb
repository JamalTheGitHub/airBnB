class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def show
    @listings = Listing.all
  end

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @listing = Listing.new
  end

  def create
    # byebug
    @reservation = Reservation.new(reservation_params)
    @reservation.listing_id = params[:listing_id]
    @reservation.user_id = current_user.id
    if @reservation.save
      ReservationMailer.reservation_email(@reservation.user, @reservation.listing.user,@reservation).deliver_now
      redirect_to root_url
    else
      redirect_to back
      flash[:error] = @reservation.errors.full_messages.join(",")
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      # byebug
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @reservation.destroy
    redirect_to back #method comes back from applicationController
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def set_reservation
    # byebug
    @reservation = Reservation.find(params[:id])
  end

  def authorize_user
    # user is redirected UNLESS they are the property owner OR a moderator/superadmin
    if current_user.id != @reservation.user_id && current_user.customer?
      redirect_to root_url, notice: "You're not authorized to do that."
    end
  end

end
