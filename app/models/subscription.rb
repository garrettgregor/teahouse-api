class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :status, presence: true, numericality: { in: (0..1) }
  validates :frequency, presence: true

  enum :frequency, %i[daily weekly monthly yearly]
  # STATUSES = %i[inactive active]
  # enum :status, STATUSES
  enum :status, %i[inactive active]

  belongs_to :customer
  belongs_to :tea

  ## Attempt to fix errors with strong params update
  
  # validate do
  #   if @not_valid_status
  #     errors.add(:status, "Not valid course type, please select from the list: #{COURSE_TYPES}")
  #   end
  # end

  # def status=(value)
  #   require 'pry'; binding.pry
  #   if !STATUSES.include?(value.to_sym)
  #     @not_valid_status = true
  #   else
  #     super value
  #   end
  # end
end
