class EventController < ApplicationController

    def new #creates new event object
      @event = Event.new
    end

    def show #index page of events
      #only show events for the user that is currently logged in
      @event = Event.find(params[:id].where(:created_by == @current_user))
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
      #make new event with user data entered
      @event = Event.new(event_params)
      #Redirect to root url with success message if completed, otherwise render new
      flash[:notice] = "event created successfully"
      render 'new'
    end

    #private method to define necessary parameters for Event object.
    private
    def event_params
      params.require(:event).permit(:eventID, :event_start_time,:event_end_time, :event_date,:created_by)
    end


end
