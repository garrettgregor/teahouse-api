class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :status, presence: true, numericality: { in: (0..1) }
  validates :frequency, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  enum :status, %i[inactive active]

  has_many :customer_subscriptions, dependent: :destroy
  has_many :customers, through: :customer_subscriptions
  has_many :subscription_teas, dependent: :destroy
  has_many :teas, through: :subscription_teas
end
