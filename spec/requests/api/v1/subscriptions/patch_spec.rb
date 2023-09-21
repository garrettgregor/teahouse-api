require "rails_helper"

RSpec.describe "Subscription Post Request" do
  let!(:customer_1) { create(:customer) }
  let!(:teas) { create_list(:tea, 2) }
  let!(:subscription) { create(:subscription, customer_id: customer_1.id, tea_id: teas[0].id, status: 0) }
  let!(:valid_patch_info) do
    {
      subscription:
        {
          status: 1
        }
    }
  end
  let!(:invalid_patch_info) do
    {
      subscription:
        {
          status: 2
        }
    }
  end
  let(:valid_headers) { { "CONTENT_TYPE" => "application/json" } }

  context "happy path" do
    it "cancels a customer's subcription" do
      patch api_v1_customer_subscription_path(customer_1, subscription), params: valid_patch_info.to_json, headers: valid_headers

      expect(response).to have_http_status(:ok)

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
      patch api_v1_customer_subscription_path(customer_1, subscription), params: invalid_patch_info.to_json, headers: valid_headers

      expect(response).to have_http_status(:not_acceptable)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:error)
      expect(parsed[:error]).to eq("Cannot update this subscription")
    end
  end
end
