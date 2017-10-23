# frozen_string_literal: true

module Admin
  class IpsController < Admin::ApplicationController
    def index
      @ips = Ip.all.paginate(page: params[:page], per_page: 10)
    end

    def new
      @ip = Ip.new
      respond_to do |format|
        format.html
        format.js
      end
    end

    def create
      @ip = Ip.new(ip_params)
      if @ip.save
        redirect_to admin_ips_path
      else
        render 'new'
      end
    end

    def edit
      @ip = Ip.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end

    def update
      Ip.find(params[:id]).update(ip_params)
      redirect_to admin_ips_path
    end

    def destroy
      @ip = Ip.find(params[:id])
      @ip.destroy
      redirect_to admin_ips_path
    end

    private

    def ip_params
      params.require(:ip).permit(:addr, :label)
    end
  end
end
