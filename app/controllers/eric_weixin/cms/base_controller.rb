class EricWeixin::Cms::BaseController < ApplicationController

  around_filter :round

  def round
    yield
  end

  def current_user
    return nil if session[:employee_id].blank?
    ::Personal::Employee.find(session[:employee_id])
  end

  def need_login
    redirect_to '/' if current_user.blank?
    return
  end

end
