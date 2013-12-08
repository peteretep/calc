class CalculationsController < ApplicationController
    respond_to :html, :js

    def index
        @calculations = Calculation.all
        if @calculations
            @last_calculation = Calculation.last
        else
            @last_calculation = Calculation.new
        end
    end

    def create
        # If the calculation exists, 
        if Calculation.exists?({a: params[:calculation][:a], b: params[:calculation][:b]})
            #retreive it
            @calculation = Calculation.where({a: params[:calculation][:a], b: params[:calculation][:b]}).first
            # And increment the count value by one
            @calculation.increment!(:counter)
        else
            # Else create a new calculation
            @calculation = Calculation.new(calc_params)
            @calculation.operation = @calculation.a + @calculation.b
            @calculation.save
        end
        # Return whichever calculation back to the page
        respond_with @calculation, :location => calculations_url
    end

    # def minus
    #     # If the calculation exists, 
    #     if Calculation.exists?({a: params[:calculation][:a], b: params[:calculation][:b]})
    #         #retreive it
    #         @calculation = Calculation.where({a: params[:calculation][:a], b: params[:calculation][:b]}).first
    #         # And increment the count value by one
    #         @calculation.increment!(:counter)
    #     else
    #         # Else create a new calculation
    #         @calculation = Calculation.new(calc_params)
    #         @calculation.operation = @calculation.a - @calculation.b
    #         @calculation.save
    #     end
    #     # Return whichever calculation back to the page
    #     respond_with @calculation, :location => calculations_url
    # end


    private
        def calc_params
            params.require(:calculation).permit(:a, :b)
        end

end
