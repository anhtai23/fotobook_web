class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user  = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @photos = Photo.all

  end

  def edit
  end

  def update
    if current_user.update(update_basic_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :website,:bio, :email, :phone, :gender, :avatars)
  end

  def update_basic_params
    params.require(:user).permit(:first_name,:avatars,:last_name,:email)
  end

end
