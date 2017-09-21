# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_location
  before_action :check_if_white_listed

  private

  # pdcoutinho@gmail.com
  # This method is long but easy to understand.
  # Splitting the logic into several one liner methods will not improve readability.
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if request.path != '/users/sign_in' &&
        request.path != '/users/sign_up' &&
        request.path != '/users/password/new' &&
        request.path != '/users/password/edit' &&
        request.path != '/users/confirmation' &&
        request.path != '/users/sign_out' &&
        !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity

  def after_sign_in_path_for(_resource)
    session[:previous_url] || root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation terms_of_service allow_emails]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password remember_me])
  end

  # rubocop:disable Style/GuardClause
  def check_if_white_listed
    unless Ip.pluck(:addr).include?(request.ip) || Ip.pluck(:addr).include?(request.env['HTTP_X_REAL_IP'])
      render(file: Rails.root.join('public', '403.html'), status: 403, layout: false)
    end
  end
  # rubocop:enable Style/GuardClause
end
