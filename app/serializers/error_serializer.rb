class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def serialize_json
    {
      errors: [
        {
          status: '404',
          title: @error.message
        }
      ]
    }
  end

  def self.invalid_status
    { error: "Cannot update this subscription" }
  end
end