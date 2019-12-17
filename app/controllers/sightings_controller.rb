class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
        # below renders nested json data, showing the bird and location attributes connected to this sighting.
        # render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
        # another similar way to do this is as below. Method below includes the foreign keys in the top level of the object, as well as in the nested object.
            render json: sighting, include: [:bird, :location], except: [:updated_at]
        else
            render json: {message: 'No sighting found with that id'}
        end
    end
end
