class ApplicationController < ActionController::API
  include Authenticable
  include PatientHelper
  include AdmissionHelper
  include DiagnosisHelper

  protected
    def authenticate_request!
      if !payload || !JsonWebToken.valid_payload(payload.first)
        return invalid_authentication
      end

      load_current_user!
      invalid_authentication unless @current_user
    end

    def invalid_authentication
      render json: { error: 'Invalid request' }, status: :unauthorized
    end

  private
    def payload
      auth_header = request.headers['Authorization']
      token       = auth_header.split(' ').last
      JsonWebToken.decode(token)
    rescue
      nil
    end

    def load_current_user!
      @current_user = User.find_by(uuid: payload[0]["uuid"])
    end
    
end
