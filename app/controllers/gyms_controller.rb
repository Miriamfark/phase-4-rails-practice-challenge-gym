class GymsController < ApplicationController
    def index 
        render json: Gym.all
    end 

    def show 
        gym = Gym.find(params[:id])
        render json: gym
    rescue ActiveRecord::RecordNotFound 
        render json: { error: "Gym not found" }, status: :not_found
    end

    def update 
        gym = Gym.find(params[:id])
        gym.update(name: params[:name], address: params[:address])
        render json: gym
    rescue ActiveRecord::RecordNotFound 
        render json: { error: "Gym not found" }, status: :not_found 
    end

    def destroy 
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Gym not found" }, status: :not_found
    end
end
