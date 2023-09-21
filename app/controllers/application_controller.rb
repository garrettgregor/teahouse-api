class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :error_response
  rescue_from ArgumentError, with: :status_error

  def error_response(error)
    render json: ErrorSerializer.new(error).serialize_json, status: :not_found
  end

  def status_error
    render json: ErrorSerializer.invalid_status, status: :not_acceptable
  end
end
