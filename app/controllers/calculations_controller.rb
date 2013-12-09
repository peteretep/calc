# This is the CalculationsController

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
    case params[:commit]
    when 'Add'
      @operation = "#{params[:calculation][:a]} + #{params[:calculation][:b]}"
      if Calculation.exists?(operation: @operation)
        @calculation = Calculation.where(operation: @operation).first
        @calculation.increment!(:counter)
      else
        @calculation = Calculation.new(calc_params)
        @calculation.operation = @operation
        @calculation.result = @calculation.a + @calculation.b
        @calculation.save
      end

    when 'Subtract'
      @operation = "#{params[:calculation][:a]} - #{params[:calculation][:b]}"
      if Calculation.exists?(operation: @operation)
        @calculation = Calculation.where(operation: @operation).first
        @calculation.increment!(:counter)
      else
        @calculation = Calculation.new(calc_params)
        @calculation.operation = @operation
        @calculation.result = @calculation.a - @calculation.b
        @calculation.save
      end

    when 'Multiply'
      @operation = "#{params[:calculation][:a]} * #{params[:calculation][:b]}"
      if Calculation.exists?(operation: @operation)
        @calculation = Calculation.where(operation: @operation).first
        @calculation.increment!(:counter)
      else
        @calculation = Calculation.new(calc_params)
        @calculation.operation = @operation
        @calculation.result = @calculation.a * @calculation.b
        @calculation.save
      end

    when 'Divide'
      @operation = "#{params[:calculation][:a]} / #{params[:calculation][:b]}"
      if Calculation.exists?(operation: @operation)
        @calculation = Calculation.where(operation: @operation).first
        @calculation.increment!(:counter)
      else
        @calculation = Calculation.new(calc_params)
        @calculation.operation = @operation
        @calculation.result = @calculation.a / @calculation.b
        @calculation.save
      end

    end
    respond_with @calculation, :location => calculations_url
  end

  private

    def calc_params
      params.require(:calculation).permit(:a, :b)
    end
end
