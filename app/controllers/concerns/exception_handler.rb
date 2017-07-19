module ExceptionHandler
  extend ActiveSupport::Concern

include do
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message}, :not_found)
    end
  end
end
