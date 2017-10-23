# frozen_string_literal: true

module Admin
  class ImagesController < Admin::ApplicationController
    def index
      @images = Image.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end

    def show
      @image = Image.find(params[:id])
    end

    def new
      @image = Image.new
    end

    def create
      @image = Image.new(image_params)
      if @image.save
        redirect_to admin_image_path(@image)
      else
        render 'new'
      end
    end

    def edit
      @image = Image.find(params[:id])
    end

    def update
      Image.find(params[:id]).update(image_params)
      redirect_to admin_image_path
    end

    def destroy
      @image = Image.find(params[:id])
      @image.destroy
      redirect_to admin_images_path
    end

    private

    def image_params
      params.require(:image).permit(:info, :file, tag_list: [])
    end
  end
end
