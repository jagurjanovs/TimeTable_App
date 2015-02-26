class EventsController < ApplicationController

    def index
      @user = User.find(session[:user])
      @events = Event.where(created_by:  @user.username)
    end

    def new #creates new event object
       @event = Event.new
    end

    def show #index page of events
      #only show events for the user that is currently logged in
      @event = Event.find(params[:id])
    end

    def edit #editor for events

      @event = Event.find(params[:id])
    end

    def update #Change event details

      @event = Event.find(params[:id])
        #if user changes event parameters
      if @event.update_attributes(event_params)
        #take them back to the show screen
        redirect_to(:action => 'show',:id => @event.id)
      else
        #otherwise make a new event
        render('new')
      end
    end

    def delete #delete event
      @event = Event.find(params[:id])
    end

    def destroy
      #find event by it's id and remove from DB
      Event.find(params[:id]).destroy
      #take user back to main page.
      redirect_to(:action => 'show')
    end

    def create

      @user = User.find(session[:user])
      #make new event with user data entered
      @event = Event.new(event_params)
      @event.created_by = @user.username

      @duplicateEvent = Event.where("start_time BETWEEN {#@event.start_time} AND {#@event.end_time}")
      #Redirect to root url with success message if completed, otherwise render new
      if @event.valid? && @event.save!
        redirect_to root_url
        flash[:notice] = "Event created successfully"
      else
        render 'new'
      end
    end

    #private method to define necessary parameters for Event object.
    private
    def event_params
      params.require(:event).permit(:title, :description, :start_time,:end_time)
    end


end