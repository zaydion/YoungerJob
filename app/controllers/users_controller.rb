class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]
  before_action :set_tags, only: [:new, :create, :edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
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

  def set_tags
    @tags = Tag.all
  end

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :dob, 
      :email, 
      :phone_number,
      tag_ids: []
    )
  end
end
