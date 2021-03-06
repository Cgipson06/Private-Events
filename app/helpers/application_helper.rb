module ApplicationHelper

  def login(user)
    session[:user_id] = user.id
  end 
  
  def logged_in?
    !session[:user_id].nil?
  end
  
  def current_user
    User.find(session[:user_id])
  end
end
