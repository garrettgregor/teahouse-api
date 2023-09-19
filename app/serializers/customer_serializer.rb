class CustomerSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :email, :address

  has_many :subscriptions
  has_many :teas
end