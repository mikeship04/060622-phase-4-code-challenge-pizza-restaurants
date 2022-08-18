class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        return render json: Restaurant.all
    end

    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant, serializer: RestaurantWithPizzasSerializer
    end

    def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        head :no_content
    end

    private

    def record_not_found
        render json: {error: "Restaurant not found"}, status: :not_found
    end

end
