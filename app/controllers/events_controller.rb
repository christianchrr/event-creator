class EventsController < ApplicationController
    before_action :require_login

    def show
        @event = Event.find(params[:id])
    end

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params(:name, :description))
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
        if @event.update(event_params(:name, :description))
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

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def event_params(*args)
        params.require(:event).permit(*args)
    end

end
