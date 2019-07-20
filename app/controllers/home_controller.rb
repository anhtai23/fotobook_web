class HomeController < ApplicationController
  before_action :authenticate_user!
  # def display_albums
  #   arr = []
  #   arr += @user.albums_photos.map{|x| x.image.url}.first(3)
  # end
  # helper_method :display_albums
  def index
    @user = current_user
    @photos = Photo.all.order(:created_at).page(params[:page])
    @photo = Photo.new
    @album = Album.new
  end
end
