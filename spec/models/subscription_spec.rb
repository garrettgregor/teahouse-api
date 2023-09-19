require "rails_helper"

RSpec.describe Subscription do
  describe "validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_numericality_of :price }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to define_enum_for(:status).with_values(%i[inactive active]) }
    it { is_expected.to define_enum_for(:frequency).with_values(%i[daily weekly monthly yearly]) }
  end

  describe "relationships" do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to belong_to(:tea) }
  end
end
