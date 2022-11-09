class MembershipsController < ApplicationController
    def create 
        membership = Membership.create!(membership_params)
        render json: membership
    rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    private 

    def membership_params 
        params.permit(:charge, :gym_id, :client_id)
    end
end
