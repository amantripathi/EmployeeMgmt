class ApplicationController < ActionController::API
  #handle exception
  rescue_from ActiveRecord::RecordNotFound do |e|
    json_response({ message: "Employee Not Found" }, :not_found)
  end

  #handle exception
  rescue_from ActiveRecord::RecordInvalid do |e|
    json_response({ message: e.message }, :unprocessable_entity)
  end
  
  #send json response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
