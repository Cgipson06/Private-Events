module UsersHelper

  def login(user)
    session[:user_id] = user.id
  end  
  
  def find_user
    @user = User.find_by("name = ?", params[:name])
    login(@user)
  end

  def upcoming_events
    user = User.find(params[:id])
    @upcoming_events = user.attended_events.where("date >= ?", Date.today)
  end
  
  def past_events
    user = User.find(params[:id])
    @past_events = user.attended_events.where("date < ?", Date.today)
  end
    
end
