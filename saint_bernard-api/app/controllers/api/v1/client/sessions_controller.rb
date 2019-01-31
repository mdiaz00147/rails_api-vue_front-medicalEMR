class Api::V1::Client::SessionsController < Api::V1::Client::ClientsController
  skip_before_action :authenticate_request!, only: [:create]

  # create a new token and returns it to the front end for further calls
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({uuid: user.uuid})
      render json: { user: user, auth_token: auth_token }, status: 201
    else
      render json: ['Invalid email || Password'], status: :unauthorized
    end
  end

  # returns true if the session is still available
  def show
    if @current_user
      render json: { m: 'Session still active' }, status: :ok 
    else
      render json: { m: 'Token expired' }, status: 401
    end
  end


end
