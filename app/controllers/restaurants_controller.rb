class RestaurantsController < ApplicationController
  before_filter :authenticate, :only => [:index, :show, :edit, :update]
  before_filter :correct_user, :only => [:show, :edit, :update]
  
  def index
    @restaurants = Restaurant.where(:user_id => current_user.id)
    
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
  end

  def edit
  end

  private
  
    def authenticate
       deny_access unless signed_in?
    end
    
    def correct_user
      @current_restaurant = Restaurant.find(params[:id])
      if current_user.id != @current_restaurant.user_id
        flash[:error] = "Permissions Denied!"
        redirect_to(restaurants_path)
      end
    end
    
end
