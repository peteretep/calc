# This is CalculationsController does the maths
class CalculationsController < ApplicationController
  respond_to :html, :js

  def index
    @calculations = Calculation.all
  end

  def create
    if params[:calculation][:a].to_i.between?(0, 100) &&
       params[:calculation][:b].to_i.between?(0, 100)
      case params[:commit]
      when 'sum'
        run_calculation(:+)
      when 'difference'
        run_calculation(:-)
      when 'multiplication'
        run_calculation(:*)
      when 'division'
        run_calculation(:/)
      end
      respond_with @calculation, location: calculations_url
    end
  end

  private

  def calc_params
    params.require(:calculation).permit(:a, :b)
  end

  private

  def run_calculation(operator)
    @operation = "#{params[:calculation][:a]} "
    @operation += operator.to_s
    @operation += " #{params[:calculation][:b]}"
    if Calculation.exists?(operation: @operation)
      @calculation = Calculation.where(operation: @operation).first
      @calculation.increment!(:counter)
    else
      @calculation = Calculation.new(calc_params)
      @calculation.operation = @operation
      @calculation.result = @calculation.a.to_f.send(operator, @calculation.b.to_f)
      @calculation.save
    end
    @calculation
  end
end
