class ReservationsController < ApplicationController
  before_action :set_reservation, only [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
