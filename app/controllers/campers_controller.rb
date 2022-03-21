class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_msg 

    def index
        campers = Camper.all 
        render json: campers 
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer 
    end

    def create 
        camper = Camper.create(camper_params)
        render json: camper, status: :created
    end

    private 

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found_msg
        render json: { error: "Camper not found" }, status: :not_found
    end

end
