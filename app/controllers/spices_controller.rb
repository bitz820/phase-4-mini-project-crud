class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices
    end

    # def show 
    #     spice = Spices.find_by(id: params[:id])
    #     render json: spice

    # end
    
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])

        if spice 
            spice.update(spice_params)
            render json: spice, status: :ok
        else
            render json: {error: "This spice is not available"}, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])

        if spice
            spice.destroy
            render json: {}, status: :no_content
        else
            render json: {error: "This spice is not available"}, status: :not_found
        end

    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
