# frozen_string_literal: true

module Admin
  class TagsController < Admin::ApplicationController
    before_action :set_tag, only: %i[show edit update destroy]

    def index
      @tags = ActsAsTaggableOn::Tag.all
                                   .order(id: :desc)
                                   .paginate(page: params[:page], per_page: 50)
    end

    def edit
      respond_to do |format|
        format.html
        format.js
      end
    end

    def update
      respond_to do |format|
        if @tag.update(tag_params)
          format.html { redirect_to admin_tags_path, notice: 'Tag was successfully updated.' }
          format.json { render :show, status: :ok, location: @tag }
        else
          format.html { render :edit }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @tag.destroy
      flash[:notice] = 'Tag was successfully deleted.'
      redirect_to admin_tags_path
    end

    private

    def set_tag
      @tag = ActsAsTaggableOn::Tag.find(params[:id])
    end

    def tag_params
      params.require(:acts_as_taggable_on_tag).permit(:id, :name)
    end
  end
end
