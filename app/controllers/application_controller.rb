class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :error_response
  rescue_from ArgumentError, with: :invalid_patch_info

  def error_response(error)
    render json: ErrorSerializer.new(error).serialize_json, status: :not_found
  end

  def invalid_patch_info(error)
    render json: ErrorSerializer.invalid_patch(error), status: :not_acceptable
  end
end
