# frozen_string_literal: true

module Admin
  class HighlightsController < Admin::ApplicationController
    def index
      @highlights = Highlight.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def update
  end

  def destroy
    flash[:notice] = 'We\'re sorry, destroy is not implemented.'
    redirect_to admin_hightlights_path
  end
end
