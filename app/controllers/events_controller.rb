class EventsController < ApplicationController
    before_action :authentication_required

    def show
        @event = Event.find(params[:id])
    end

    def index
        @events = Event.all
    end

    def new
        @locations = Location.all
        @event = Event.new
    end

    def create
        @locations = Location.all
        @event = Event.new(event_params(:name, :description, :month, :day, :year, location_id: [], location_attributes: [:name, :address, :city, :state, :zip]))
        @event.user_id = current_user.id
        # @event.location_id = 
        if @event.save
            flash[:message] = "Event created!"
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @event.update(event_params(:name, :description, :month, :day, :year, :location))
          redirect_to event_path(@event)
        else
          render :edit
        end
    end
    
    def destroy
        @event.destroy
        redirect_to events_path
    end

    private

    def event_params(*args)
        params.require(:event).permit(*args)
    end

end
