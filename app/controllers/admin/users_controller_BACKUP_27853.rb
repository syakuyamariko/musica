class Admin::UsersController < ApplicationController

  def index
<<<<<<< HEAD
    @users = User.all.page(params[:page]).per(10)
=======
    @users = User.all.page(params[:page])
>>>>>>> origin/main
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
<<<<<<< HEAD
    if @user.update!(user_params)
=======
    if @user.update(user_params)
>>>>>>> origin/main
      flash[:notice] = "会員情報が更新されました。"
      redirect_to admin_user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :account_id, :email, :is_deleted)
  end

end

