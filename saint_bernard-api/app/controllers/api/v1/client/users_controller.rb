class Api::V1::Client::UsersController < Api::V1::Client::ClientsController
  skip_before_action :authenticate_request!, only: [:create]

  # register new staff member on the platform
  def create
    user = User.new(user_params)
    if user.save
      auth_token = JsonWebToken.encode({uuid: user.uuid})
      render json: { user: user, auth_token: auth_token }, status: 200
    else
      render json: user.errors.map { |x, mess| "#{x} #{mess}".capitalize }, status: 400
    end
  end


  private
    def user_params
      params.permit(
        :first_name,
        :last_name,
        :phone,
        :email,
        :password,
        :password_confirmation,
        :rol,
        :avatar
      )
    end

end
