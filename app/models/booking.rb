class Booking < ApplicationRecord
  belongs_to :user
  validates :fromdate, :todate, overlap: { scope: 'seat',
                                             message_content: 'overlaps with other bookings' }
  validate :verifyenddateafterstartdate?

  def verifyenddateafterstartdate?
    if self.todate < self.fromdate
      errors.add :todate, "must be after fromdate"
    end
  end
end