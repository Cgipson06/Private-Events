class InviteController < ApplicationController
  def new
  end
  
  def create
    @invite = Invite.new(params)
    @invite.save
  end
  
  
  
  private
  

end
