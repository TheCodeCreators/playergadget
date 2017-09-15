# frozen_string_literal: true

class MembersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id].downcase)
  end

  def profile
    @user = User.friendly.find(params[:id].downcase)
  end
end
