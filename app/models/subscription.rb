class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :status, presence: true, numericality: { in: (0..1) }
  validates :frequency, presence: true, numericality: { in: (0..3) }

  enum :frequency, %i[daily weekly monthly yearly]
  enum :status, %i[inactive active]

  belongs_to :customer
  belongs_to :tea
end
