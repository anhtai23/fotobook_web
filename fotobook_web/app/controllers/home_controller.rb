class HomeController < ApplicationController
  def display_albums
    arr = []
    arr += @user.albums_photos.map{|x| x.image.url}.first(3)
  end

  helper_method :display_albums
  def index
    @user = current_user
    @photos = Photo.all
    @photo = Photo.new
    @album = Album.new
    if current_user
      @posts = Post.order(created_at: :desc).page(params[:page]).per(5)
    else
      redirect_to new_user_session_path
    end
  end
end
