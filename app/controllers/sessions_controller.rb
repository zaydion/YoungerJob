class SessionsController < ApplicationController
  def user_new
  end

  def company_new
  end

  def create
    puts("#"*100)
    puts(session_params)
    puts("#"*100)
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
      print "company yes"
    else
      puts "company nope"
      render :company_new
    end
  end

  def user_create
    user = User.find_by(email: params[:session][:email].downcase)
    puts("user: #{user}")
    if user && user.authenticate(params[:session][:password])
      puts "user login"
    else
      puts "user nope"
      render :user_new
    end
  end

  def destroy
  end

  private
  def session_params
    params.require(:session).permit(:email, :password, :password_confirmation, :user_type)
  end
end
