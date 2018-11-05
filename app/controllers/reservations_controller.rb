class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    # byebug
    @reservation = Reservation.new(reservation_params)
    @reservation.listing_id = params[:listing_id]
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
