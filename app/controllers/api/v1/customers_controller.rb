module Api
  module V1
    class CustomersController < ApplicationController
      def show
        render json: CustomerSerializer.customer_subscription_details(Customer.find(params[:id])), status: :ok
      end
    end
  end
end
