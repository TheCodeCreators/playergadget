# frozen_string_literal: true

module Admin
  class HighlightsController < Admin::ApplicationController
    def index
      @highlights = Highlight.all
                             .order(created_at: :asc)
                             .paginate(page: params[:page], per_page: 10)
    end

    def new
      @highlight = Highlight.new
      respond_to do |format|
        format.html
        format.js
      end
    end

    def create
      @highlight = Highlight.new(highlight_params)
      if @highlight.save
        redirect_to admin_highlights_path
      else
        render 'new'
      end
    end

    def edit
      @highlight = Highlight.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end

    def update
      Highlight.find(params[:id]).update(highlight_params)
      redirect_to admin_highlights_path
    end

    def destroy
      flash[:notice] = 'We\'re sorry, destroy is not implemented.'
      redirect_to admin_hightlights_path
    end

    def highlight_params
      params.require(:highlight).permit(:position, :active, :article_id)
    end
  end
end
