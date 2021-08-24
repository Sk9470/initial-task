class ApplicationController < ActionController::API
  include Pundit
  include ExceptionHandler
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
end
