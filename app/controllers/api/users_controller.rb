class API::UsersController < API::BaseController
  before_action :fetch_user, only: [:update, :show, :destroy]
  skip_before_action :authenticate_user, only: [:sign_in]
  def sign_in
    token = User.authenticate(params[:user][:email], params[:user][:password])
    if token
      render json: { auth_token: token.token }
    else
      render json: { error: 'Wrong credentials' }, status: :bad_request
    end
  end

  def create
    authorize User
    @user = User.create(user_params)
    if @user.persisted?
      render
    else
      render json: { error: 'Validation Error' }, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all_except(current_user)
  end

  def update
    authorize @user
    @user.update_attributes(user_params)
  end

  def show
  end

  def destroy
    authorize @user
    @user.destroy
  end

  private
  def user_params
    permited_fields = [:password, :password_confirmation, :email, :login]
    permited_fields << :role if UserPolicy.new(current_user, @user).change_role?
    params.require(:user).permit(permited_fields)
  end

  def fetch_user
    @user = User.find(params[:id])
  end
end