# frozen_string_literal: true

module Admin
  class UsersController < Admin::ApplicationController
    def index
      @users = UserSearch.get(params, per_page)
    end
  end
end
