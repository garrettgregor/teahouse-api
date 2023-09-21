class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def serialize_json
    {
      errors: [
        {
          status: "404",
          title: @error.message
        }
      ]
    }
  end

  def self.invalid_subscription_post(errors)
    {
      errors:
      errors.map do |error|
        {
          status: "406",
          title: error
        }
      end
    }
  end

  # Refactor: need to account for when updating multiple errors
  # currently responds with only the first error
  def self.invalid_patch(error)
    {
      errors: [
        {
          status: "406",
          title: error.message
        }
      ]
    }
  end
end
