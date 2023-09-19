require "rails_helper"

RSpec.describe "Subscription Post Request" do
  let!(:customer_1) { create(:customer) }
  let!(:teas) { create_list(:tea, 2) }
  let!(:valid_post_info) do
    {
      tea_id: teas[0].id,
      title: "Student Subscription",
      price: 5.99,
      status: 1,
      frequency: 0
    }
  end

  let!(:invalid_post_info) do
    {
      title: "Student Subscription",
      price: 5.99,
      status: 1,
      frequency: 0
    }
  end

  let(:valid_headers) { { "CONTENT_TYPE" => "application/json" } }

  context "happy path" do
    it "establishes an endpoint to update a customer's subcription" do
      post api_v1_customer_subscriptions_path(customer_1), params: valid_post_info.to_json, headers: valid_headers

      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to have_key(:title)
      expect(parsed[:data][:attributes]).to have_key(:price)
      expect(parsed[:data][:attributes]).to have_key(:status)
      expect(parsed[:data][:attributes][:status]).to eq("active")
      expect(parsed[:data][:attributes]).to have_key(:frequency)
      expect(parsed[:data][:relationships][:tea][:data][:id].to_i).to eq(teas[0].id)
    end
  end

  context "sad path" do
    it "returns an error message when subscription wasn't created" do
      post api_v1_customer_subscriptions_path(customer_1), params: invalid_post_info.to_json, headers: valid_headers

      expect(response.status).to eq(406)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:error)
      expect(parsed[:error]).to eq("Cannot create this subscription")
    end
  end
end
