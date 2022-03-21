class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_msg 

    def index 
        activities = Activity.all 
        render json: activities 
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content 
    end

    private 

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found_msg
        render json: { error: "Activity not found" }, status: :not_found
    end


end
