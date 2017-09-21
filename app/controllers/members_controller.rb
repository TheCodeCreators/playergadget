# frozen_string_literal: true

class MembersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id].downcase)
  end

  def account
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(member_params)
    if @user.save
      redirect_to users_account_path
    else
      render 'account'
    end
  end

  private

  def member_params
    params.require(:user).permit(:username,
                                 :first_name,
                                 :last_name,
                                 :allow_emails,
                                 :email,
                                 :steam_uid)
  end
end
