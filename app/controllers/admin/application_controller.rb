module Admin
  class ApplicationController < ActionController::Base
    layout 'admin/layouts/application'
    before_action :authenticate_user!
    before_action :for_admin!

    private

    def for_admin!
      redirect_to(root_path) && return unless current_user.admin?
    end

    def per_page
      cookies[:per_page] ||= 20
    end
  end
end
