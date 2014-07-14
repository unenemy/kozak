class API::BaseController < ApplicationController
  include Pundit
  include API::AuthLogic
  respond_to :json
end