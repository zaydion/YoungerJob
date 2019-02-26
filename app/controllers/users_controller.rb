class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]

  def index
    @users = User.all
  end

  def new
    @user = user.new
  end

  def create
    @user.create(user_params)
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  def delete
    @user.delete!
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :dob, :email, :identification_number, :phone_number)
  end
end
