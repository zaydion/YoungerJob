module SessionHelper
  def log_in_user(user)
    session[:user_id] = user.id
  end

  def log_in_company(company)
    session[:company_id] = company.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif session[:company_id]
      @current_user ||= Company.find_by(id: session[:company_id])
    end
  end

  def require_current_user
    if logged_in_as_user?
      current_user == @user
    elsif logged_in_as_company?
      current_user == @company
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_as_user?
    current_user.is_a?(User)
  end

  def logged_in_as_company?
    current_user.is_a?(Company)
  end

  def log_out
    if logged_in_as_user?
      session.delete(:user_id)
    elsif logged_in_as_company?
      session.delete(:company_id)
    end
    @current_user = nil
  end

end
