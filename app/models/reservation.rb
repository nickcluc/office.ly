class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validate :start_cannot_be_greater_than_end, :start_cant_be_in_the_past

  after_validation :totalize

  private

  def start_cannot_be_greater_than_end
    errors.add(:start_date, "can't be after end date") if
    start_date > end_date
  end

  def start_cant_be_in_the_past
    errors.add(:start_date, "can't be in the past! (Time travel feature coming soon!)") if
    start_date < Date.current
  end

  def totalize
    self.total_cost = (self.listing.weekly_rate * ( (self.end_date - self.start_date) / 7 ).to_f).round(2)
  end
end
