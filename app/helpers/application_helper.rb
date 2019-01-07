module ApplicationHelper
  def getuser
      @user = session[:user]["id"]
  end
end
