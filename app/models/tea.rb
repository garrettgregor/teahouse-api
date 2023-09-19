class Tea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :temperature, presence: true, numericality: true
  validates :brew_time, presence: true, numericality: true

  has_many :subscription_teas, dependent: :destroy
  has_many :subscriptions, through: :subscription_teas
  has_many :customer_subscriptions, through: :subscriptions
  has_many :customers, through: :customer_subscriptions
end
