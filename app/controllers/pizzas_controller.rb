class PizzasController < ApplicationController

    def index
        return render json: Pizza.all
    end
end
