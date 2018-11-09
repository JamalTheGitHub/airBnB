class ReservationMailer < ApplicationMailer
  default from: 'JBnBNotification@JBnB.com'

  def reservation_email(customer, host, reservation)
    @customer = customer
    @host = host
    @reservation = reservation
    @url = "http://localhost:3000/listings/#{@reservation.listing_id}/reservations/#{@reservation.id}"
    mail(to: @host.email, subject: "Bookings Made!")
  end
end
