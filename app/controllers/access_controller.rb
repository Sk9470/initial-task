class AccessController < ApplicationController
  before_action :doorkeeper_authorize!, except: %i[sign_up]

  private

  def current_user
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id]) if doorkeeper_token
  end
end
