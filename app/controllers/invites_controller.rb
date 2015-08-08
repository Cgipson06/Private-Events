class InvitesController < ApplicationController
  def new
  end
  
  def create
    @invite = Invite.new(invite_params)
    @invite.save
    @user = User.find(session[:user_id])
    redirect_to @user
    
  end
  
  
  
  private
  
  def invite_params
    params.permit(:attendee_id, :attended_event_id)
  end
  

end
