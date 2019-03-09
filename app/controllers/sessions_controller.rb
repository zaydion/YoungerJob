class SessionsController < ApplicationController
  skip_before_action :require_login

  def user_new
  end

  def company_new
  end

  def create
    user_type = session_params[:user_type].downcase
    if user_type == 'user'
      user_create
    elsif user_type == 'company'
      company_create
    end
  end

  def company_create
    company = Company.find_by(email: params[:session][:email].downcase)
    if company && company.authenticate(params[:session][:password])
      log_in_company(company)
      redirect_to company
    else
      flash.now[:danger] = "Combinación de correo electrónico / contraseña no válida"
      render :company_new
    end
  end

  def user_create
    user = User.find_by(email: params[:session][:email].downcase)
    puts("user: #{user}")
    if user && user.authenticate(params[:session][:password])
      log_in_user(user)
      redirect_to company
    else
      flash.now[:danger] = "Combinación de correo electrónico / contraseña no válida"
      render :user_new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password, :password_confirmation, :user_type)
  end
end
