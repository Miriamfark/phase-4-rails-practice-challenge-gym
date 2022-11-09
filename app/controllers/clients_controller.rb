class ClientsController < ApplicationController
    def index 
        clients = Client.all
        render json: clients, except: [:updated_at, :created_at, :total_amount]
    end

    def show 
        client = Client.find(params[:id])
        render json: client, except: [:updated_at, :created_at]
    rescue ActiveRecord::RecordNotFound 
        render json: { error: "Client not found" }, status: :not_found
    end

    def update 
        client = Client.find(params[:id])
        client.update(name: params[:name], age: params[:age])
        render json: client, except: [:updated_at, :created_at, :total_amount]
    rescue ActiveRecord::RecordNotFound 
        render json: { error: "Client not found" }, status: :not_found
    end
end
