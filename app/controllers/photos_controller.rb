class PhotosController < ApplicationController
  before_action :set_room, except: [:index, :new, :create,:delete_image_attachment]
  def create
    @room = Room.find(params[:room_id])

    return unless params[:images]

    params[:images].each do |img|
      @room.photos.create(image: img)
    end

    @photos = @room.photos
    redirect_back(fallback_location: request.referer, notice: 'Saved...')
  end

  def destroy
    @photo = Photo.find(params[:id])
    @room = @photo.room

    @photo.destroy
    @photos = Photo.where(room_id: @room.id)

    respond_to :js
  end
end
