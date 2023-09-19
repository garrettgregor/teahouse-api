require "rails_helper"

RSpec.describe Subscription, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_numericality_of :price }
    it { should validate_presence_of :status }
    it { should validate_numericality_of :frequency }
    it { should define_enum_for(:status).with_values(%i[inactive active]) }
  end

  describe "relationships" do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end
end
