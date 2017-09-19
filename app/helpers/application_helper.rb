# frozen_string_literal: true

module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def display_ads?
    ENV['RAILS_ENV'] == 'production'
  end

  def can_show_session_links(page)
    return page == 'signup' if controller_name == 'sessions'
    return page == 'login' if controller_name == 'registrations'
    return true unless current_user
  end
end
