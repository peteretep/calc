class CalculationsController < ApplicationController
    respond_to :html, :js

    def index
        @calculations = Calculation.all
        @last_calculation = Calculation.last
    end

    def create
      #  @calculation = Calculation.where("a like ? AND b like ?", "#{params[:a]}", "%#{params[:b]}%")

         @calculation = Calculation.new(calc_params)

         @calculation.save

        respond_with @calculation, :location => calculations_url
    end
    private
        def calc_params
            params.require(:calculation).permit(:a, :b)
        end

end
