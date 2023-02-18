class CampersController < ApplicationController

    def index 
        campers = Camper.all
        render json: campers
    end

    def show 
        camper = find_camper 
        if camper
        render json: camper, serializer: CamperWithActivitiesSerializer
        else  
            render_not_found_response
        end
    end 

    def create 
        camper = Camper.create(camper_params) 
        if camper 
            render json: camper, status: :created 
        else  
            render_validation_errors
        end
    end



    private 

    def camper_params 
        params.permit(:name, :age)
    end

    def find_camper
        Camper.find(params[:id])
    end

    def render_not_found_response 
        render json: {error: "Camper not found"}, status: :not_found
    end 

    def render_validation_errors 
        render json: {error: "validation errors"}, status: :unprocessable_entity
    end
end
