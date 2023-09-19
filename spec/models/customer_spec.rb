require "rails_helper"

RSpec.describe Customer do
  describe "validations" do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :address }
  end

  describe "relationships" do
    it { is_expected.to have_many(:subscriptions) }
    it { is_expected.to have_many(:teas).through(:subscriptions) }
  end
end
