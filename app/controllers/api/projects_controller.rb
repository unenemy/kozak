class API::ProjectsController < API::BaseController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  private
  def user_params
    params.require(:project).permit(:title)
  end
end