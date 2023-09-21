class CustomerSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :email, :address

  has_many :subscriptions
  has_many :teas

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def self.customer_subscription_details(customer)
    {
      data:
      {
        type: "customer",
        id: customer.id,
        attributes:
        {
          first_name: customer.first_name,
          last_name: customer.last_name,
          email: customer.email,
          address: customer.address
        },
        subscriptions:
        customer.subscriptions.map do |subscription|
          {
            id: subscription.id,
            title: subscription.title,
            status: subscription.status,
            price: subscription.price,
            frequency: subscription.frequency,
            tea_id: subscription.tea.id,
            tea_name: subscription.tea.title,
            tea_description: subscription.tea.description,
            tea_temperature: subscription.tea.temperature,
            tea_brew_time: subscription.tea.brew_time
          }
        end
      }
    }
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
