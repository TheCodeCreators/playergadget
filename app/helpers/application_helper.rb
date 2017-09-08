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

  def can_show_session_links
    !current_user && controller_name != 'sessions' && controller_name != 'registrations'
  end
end
