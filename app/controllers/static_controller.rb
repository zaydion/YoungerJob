class StaticController < ApplicationController
  skip_before_action :require_login

  def welcome
  end

  def about
  end
end
