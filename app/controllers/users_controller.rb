class UsersController < ApplicationController
  before_action :set_user_include_tags, only: [:show, :edit, :update]
  before_action :set_user, only: [:matches, :destroy]
  before_action :set_tags, only: [:new, :create, :edit, :update]
  before_action :require_current_user, only: [:edit, :update]
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in_user @user
        format.html { redirect_to user_matches_path @user, notice: 'Usuario fue creado exitosamente' }
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
        format.html { redirect_to @user, notice: 'Usuario fue actualizado exitosamente.' }
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
      format.html { redirect_to root_path, notice: 'Usuario fue destruido exitosamente' }
      format.json { head :no_content }
    end
  end

  def matches
    @posts = @user.matches
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_user_include_tags
    @user = User.includes(:tags).find(params[:id])
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
      :password,
      :avatar,
      :description,
      :resume,
      tag_ids: []
    )
  end
end
