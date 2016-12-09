class CarsController < ApplicationController
  def index
  end

  def create
    if (session[:car].nil?)
      make = params[:make]
      model = params[:model]
      year = params[:year]
      @car = Car.new(make, model, year)
      session[:car] = @car.to_yaml
    else
      @car = YAML.load(session[:car])
    end
  end

  def accelerate
    @car = YAML.load(session[:car])
    @car.accelerate
    session[:car] = @car.to_yaml
    redirect_to '/cars/create'
  end
end
