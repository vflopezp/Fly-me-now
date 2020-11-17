class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :inex, unless: :skip_pundit?

  private

  def skip_pundit?
    device_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
