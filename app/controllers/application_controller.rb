class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :check_auth

  private 

  def not_found invalid
    render json: {errors: invalid.errors}
  end

  def invalid_record invalid
    render json: {errors:invalid.record.errors}
  end

  def check_auth
    render json: {error: "Not Authorized"} unless session.include? :user_id
  end
end
