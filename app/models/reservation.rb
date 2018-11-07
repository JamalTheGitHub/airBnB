class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :start_date_greater_than_end_date,
           :date_does_not_overlap,
           :cannot_predate_current_date
           
  def total_price
    (self.end_date.to_date - self.start_date.to_date).to_i * self.listing.price_per_day
  end

  private
  def start_date_greater_than_end_date
    # byebug
    if start_date > end_date
      errors.add(:end_date)
    end
  end
  
  def date_does_not_overlap
    self.listing.reservations.each do |reserve|
      if (self.start_date..self.end_date).overlaps?(reserve.start_date..reserve.end_date)
        errors.add(:start_date, :end_date)
      end
    end
  end

  def cannot_predate_current_date
    if start_date < Date.today
      errors.add(:start_date, "is invalid!")
    end
  end

end
