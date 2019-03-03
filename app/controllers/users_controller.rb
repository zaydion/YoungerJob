class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    # print("#" * 100)
    # puts(user_params)
    # puts(user_params[:dob].to_date)
    # print("#" * 100)
    # puts("year: #{user_params[:dob].to_date.year}")
    # puts("month: #{user_params[:dob].to_date.month}")
    # puts("day: #{user_params[:dob].to_date.day}")
    # @user.create(user_params)
    # @user = User.new(user_params)
    # puts("\n")
    # puts("user valid: #{@user.valid?}")
    # puts("user.errors: #{@user.errors[:email]}")
    # puts("user.errors: #{@user.errors[:dob]}")

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :dob, :email, :identification_number, :phone_number)
  end
end
