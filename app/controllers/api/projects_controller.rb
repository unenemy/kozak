class API::ProjectsController < API::BaseController
  def index
    render json: { projects: [] }
  end

  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :login)
  end
end