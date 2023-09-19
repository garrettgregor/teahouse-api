require "rails_helper"

RSpec.describe Tea do
  describe "validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_numericality_of :temperature }
    it { is_expected.to validate_numericality_of :brew_time }
  end

  describe "relationships" do
    it { is_expected.to have_many(:customers).through(:subscriptions) }
    it { is_expected.to have_many(:subscriptions) }
  end
end
