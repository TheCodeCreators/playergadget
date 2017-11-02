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

  def generate_articles_list
    Article.published.includes(:user)
           .references(:user)
           .order('articles.title ASC')
           .map { |article|
             ["#{article.title} //
              #{article.user.name}",
              article.id]
           }
  end

  def enum_to_collection(model, method)
    collection = []
    model.capitalize.constantize.send(method.to_sym).each do |k, _v|
      collection << [k.humanize, k]
    end
    collection
  end

  # Returns a list with all object's tags
  def get_object_tags(object)
    return if object.tag_list.blank?
    tags = ''
    object.tag_list.each do |tag|
      tags += "<li><span><a href='" + admin_tag_path(tag) + "' class='badge badge-default'>" + tag + '</a></span></li>'
    end
    "<ul class='list-inline'>" + tags + '</ul>'
  end
end
