class UsersController < ApplicationController
include ApplicationHelper
before_action :require_login, only: [:index]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = "Welcome to Private Events"
      redirect_to '/users'
    else
      render 'new'
    end
  end
  
  def show
    @events = User.find(params[:id]).events
    upcoming_events
    past_events
    
    end
    
  def index
    @users = User.all
  end
    
    
    
   
  
  private
    def user_params
    params.require(:user).permit(:name, :email)
  end
  
    def current_user
      current_user = User.find(session[:user_id])
    end
    
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this area"
        redirect_to signup_path
      end
    end
      
end
