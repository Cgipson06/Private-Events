class SessionController < ApplicationController
  def new
    end
  
  def create
    user = User.find_by("name = ?", session_params[:name])
    
    if !user.nil?
      login user
      redirect_to root_path
    else
     redirect_to signup_path
    end
  end
  
  def destroy
    reset_session
    redirect_to :root
  end
  

  private
  
  def session_params
    params.require(:session).permit(:name)
  end
end
