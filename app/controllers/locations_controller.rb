class LocationsController < ApplicationController
    before_action :authentication_required

    def show
        @location = Location.find(params[:id])
    end

    def index
        @locations = Location.all
    end

    def new
        @location = Location.new
    end

    def create
        @location = Location.new(location_params(:name, :address, :city, :state, :zip))
        if @location.save
            flash[:message] = "Location created!"
            redirect_to location_path(@location)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @location.update(location_params(:name, :address, :city, :state, :zip))
          redirect_to location_path(@location)
        else
          render :edit
        end
    end
    
    def destroy
        @location.destroy
        redirect_to locations_path
    end

    private

    def location_params(*args)
        params.require(:location).permit(*args)
    end

end
