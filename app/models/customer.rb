class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true

  has_many :customer_subscriptions, dependent: :destroy
  has_many :subscriptions, through: :customer_subscriptions, dependent: :destroy
  has_many :subscription_teas, through: :subscriptions, dependent: :destroy
  has_many :teas, through: :subscription_teas, dependent: :destroy
end
