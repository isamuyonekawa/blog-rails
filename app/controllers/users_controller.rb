class UsersController < ApplicationController
  before_action :set_user_find, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = '登録が完了しました。ログインしてください。'
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def show
    @favorites_blog = @user.favorite_blogs
  end

  def edit
  end

  def update
    if @user.update(user_update_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:name, :email, :image, :image_cache)
  end

  def set_user_find
    @user = User.find(params[:id])
  end

end
