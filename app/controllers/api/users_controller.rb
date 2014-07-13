class API::UsersController < API::BaseController
  skip_before_action :authenticate_user, only: [:sign_in, :sign_up]
  def sign_in
    token = User.authenticate(params[:user][:email], params[:user][:password])
    if token
      render json: { auth_token: token.token }
    else
      render json: { error: 'Wrong credentials' }, status: :bad_request
    end
  end

  def sign_up
    user = User.create(user_params)
    if user.persisted?
      render json: { user: user.to_json, auth_token: user.tokens.create.token }, status: :created
    else
      render json: { error: 'Validation Error' }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :login)
  end
end