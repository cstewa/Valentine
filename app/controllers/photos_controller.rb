class PhotosController < ApplicationController
  def create
    @photo = Photo.new(params[:photo])
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to user_url(current_user.id)
    else
      redirect_to user_url(current_user.id), notice: "Oops. Photo wouldn't upload. Try again :)"
    end
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
  end

  def update
  end
end
