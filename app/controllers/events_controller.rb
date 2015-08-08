class EventsController < ApplicationController
def new
   @event = current_user.events.new
end
def create
  @event = current_user.events.build(events_params)
  if @event.save
    @invite = current_user.invites.build({:attended_event_id => @event.id, :attendee_id => @event.creator.id})
    @invite.save
    redirect_to @event
  else
    render 'new'
  end
    
end 

def show
  @attendees = Event.find(params[:id]).attendees
  @event = Event.find(params[:id])
  @invite = Invite.create
  
end

def index 
  @past_events = Event.past
  @upcoming_events = Event.upcoming
  
end

private
  def events_params
    params.require(:event).permit(:title, :date,  :body)
  end
  
  def invite_params
    params.require(:invite).permit(:attendee_id, :attended_event_id)
  end
  
  
  def current_user
      current_user = User.find(session[:user_id])
    end


end
