class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:posts_page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
