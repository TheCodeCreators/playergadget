# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  protect_from_forgery except: :steam
  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def steam
    @user = User.find_for_steam_oauth(request.env['omniauth.auth'], current_user)
    if current_user
      set_flash_message(:notice, 'Steam account added to your account.') if is_navigational_format?
      redirect_to "/users/account"
      return
    end
    if @user
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Steam') if is_navigational_format?
    else
      flash[:notice] = "We couldn't match your Steam account with any PlayerGadget account"
      redirect_to new_user_session_path
    end
  end
end
