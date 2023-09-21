module Api
  module V1
    class SubscriptionsController < ApplicationController
      def create
        customer = Customer.find(params[:customer_id])
        subscription = customer.subscriptions.new(subscription_params)
        if subscription.save
          render json: SubscriptionSerializer.new(subscription), status: :ok
        else
          render json: ErrorSerializer.invalid_subscription_post(subscription.errors.full_messages), status: :not_acceptable
        end
      end

      def update
        subscription = Subscription.find(params[:id])
        subscription.update(subscription_params)
        render json: SubscriptionSerializer.new(subscription), status: :ok
      end

      private

      def subscription_params
        params.require(:subscription).permit(:status, :title, :price, :tea_id, :frequency)
      end
    end
  end
end
