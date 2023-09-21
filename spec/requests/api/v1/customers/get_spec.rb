require "rails_helper"

RSpec.describe "Customer Get Request" do
  let!(:customer_1) { create(:customer) }
  let!(:teas) { create_list(:tea, 2) }
  let!(:subscription_1) { create(:subscription, customer: customer_1, tea: teas[0], status: 0) }
  let!(:subscription_2) { create(:subscription, customer: customer_1, tea: teas[1], status: 1) }
  let(:valid_headers) { { "CONTENT_TYPE" => "application/json" } }

  context "happy path" do
    it "establishes an endpoint to get all of a customer's subcription" do
      get api_v1_customer_path(customer_1)

      expect(response).to have_http_status(:ok)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to eq(customer_1.id)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes][:first_name]).to eq(customer_1.first_name)
      expect(parsed[:data][:attributes][:last_name]).to eq(customer_1.last_name)
      expect(parsed[:data][:attributes][:email]).to eq(customer_1.email)
      expect(parsed[:data][:attributes][:address]).to eq(customer_1.address)
      expect(parsed[:data]).to have_key(:subscriptions)
      expect(parsed[:data][:subscriptions].first[:title]).to eq(subscription_1.title)
      expect(parsed[:data][:subscriptions].first[:status]).to eq(subscription_1.status)
      expect(parsed[:data][:subscriptions].first[:price]).to eq(subscription_1.price)
      expect(parsed[:data][:subscriptions].first[:tea_id]).to eq(teas[0].id)
    end
  end

  context "sad path" do
    it "returns an error message when subscription wasn't created" do
      get api_v1_customer_path(2)

      expect(response).to have_http_status(:not_found)

      parsed = JSON.parse(response.body, symbolize_names: true)
      
      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:errors)
      expect(parsed[:errors]).to be_an(Array)
      expect(parsed[:errors].first[:status]).to eq("404")
      expect(parsed[:errors].first[:title]).to eq("Couldn't find Customer with 'id'=2")
    end
  end
end
