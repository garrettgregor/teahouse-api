module Api
  module V1
    class SubscriptionsController < ApplicationController
      before_action :get_subscription

      def update
        @subscription.update(subscription_params)
        render json: SubscriptionSerializer.new(@subscription), status: :ok
      end

      private
      def get_subscription
        @subscription = Subscription.find(params[:id])
      end

      def subscription_params
        params.permit(:status)
      end
    end
  end
end