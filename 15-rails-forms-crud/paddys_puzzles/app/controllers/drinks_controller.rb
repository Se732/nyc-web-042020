class DrinksController < ApplicationController
  def index 
    @drinks = Drink.all
    # render :index
  end 

  def show 
    @drink = Drink.find(params[:id])
  end 

  def new 
    @drink = Drink.new
    render :new
  end 

  def create
    drink = Drink.create(drink_params)
    
    redirect_to drink_path(drink.id)
  end 

  def edit 
    @drink = Drink.find(params[:id])
  end 
  
  def update 
    drink = Drink.find(params[:id])
    drink.update(drink_params)

    redirect_to drink_path(drink)
  end 

  private 

  def drink_params
    params.require(:drink).permit(:name, :img_url, :ounces, :category)
  end 
end

