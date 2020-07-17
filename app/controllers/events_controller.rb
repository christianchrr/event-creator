class EventsController < ApplicationController
    before_action :authentication_required
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        if params[:location_id]
            @location = Location.find_by(id: params[:location_id])
            @events = @location.events
        else
            @events = Event.all
        end
    end

    def new
        if params[:location_id]
            @location = Location.find_by(id: params[:location_id])
        end
        @locations = Location.all
        @event = Event.new
    end

    def create
        @locations = Location.all
        @event = Event.new(event_params(:name, :description, :month, :day, :year, :location_id))
        @event.user_id = current_user.id
        if @event.save
            flash[:message] = "Event created!"
            redirect_to params[:location_id] ? location_event_path(params[:location_id], @event) : @event
        else
            render :new
        end
    end

    def edit
        @locations = Location.all
    end

    def update
        if @event.update(event_params(:name, :description, :month, :day, :year, :location_id))
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

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params(*args)
        params.require(:event).permit(*args)
    end

end
