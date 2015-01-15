class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  after_validation :totalize

  private

  def totalize
    self.total_cost = (self.listing.weekly_rate * ( (self.end_date - self.start_date) / 7 ).to_f).round(2)
  end
end
