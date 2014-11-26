class PhotosController < ApplicationController
  layout 'photo'
   respond_to :html, :xml, :json
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    user =session[:user_id]
    @photos = Photo.where(user_id:user)
    respond_with(@photos)
  end

  def show
    respond_with(@photo)
  end

  def new
    @photo = Photo.new
    respond_with(@photo)
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    respond_with(@photo)
  end

  def update
    @photo.update(photo_params)
    respond_with(@photo)
  end

  def destroy
    @photo.destroy
    respond_with(@photo)
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:title, :description, :image)
    end
end
