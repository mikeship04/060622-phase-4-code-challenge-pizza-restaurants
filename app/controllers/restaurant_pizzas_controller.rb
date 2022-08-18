class RestaurantPizzasController < ApplicationController

    def create
        rest_pizza = RestaurantPizza.create!(pizza_params)
        render json: rest_pizza.pizza, status: :created
    end

    private

    def pizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end
end
