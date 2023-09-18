require "rails_helper"

RSpec.describe Subscription, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_numericality_of :price }
    it { should validate_presence_of :status }
    it { should validate_numericality_of :frequency }
    it { should define_enum_for(:status).with_values([:unsubscribed, :subscribed]) }
  end

  describe "relationships" do
    it { should have_many(:customers).through(:customer_subscriptions) }
    it { should have_many(:customers) }
    it { should have_many(:teas).through(:subscription_teas) }
    it { should have_many(:teas) }
  end
end