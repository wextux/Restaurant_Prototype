class RestaurantsController < ApplicationController
  before_filter :authenticate, :only => [:show, :edit, :update]
  before_filter :index_authenticate, :only => [:index]
  #after_filter :sendpush, :only => [:index, :show]
  

  def index
    @restaurants = Restaurant.where(:user_id => current_user.id)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @restaurants }
      format.json { render :json => @restaurants }
    end
    
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @restaurant }
      format.json { render :json => @restaurant }
    end
  end

  def new
  end

  def edit
  end

  private
  
    def authenticate
       respond_to do |format|
          format.html { 
            deny_access unless signed_in?
            if (signed_in?) 
              correct_user
            end
          }
          format.xml  { webservice_authenticate }
          format.json { webservice_authenticate }
        end
       
    end
    
    def correct_user
      @current_restaurant = Restaurant.find(params[:id])
      if current_user.id != @current_restaurant.user_id
        flash[:error] = "Permissions Denied!"
        redirect_to(restaurants_path)
      end
    end
    
    def webservice_authenticate
      @current_restaurant = Restaurant.find(params[:id])
      authenticate_or_request_with_http_basic do |username, password|
        @webservice_user = User.find_by_email(username)
        if @webservice_user.id == @current_restaurant.user_id
          if @webservice_user.nil?
            false
          else
            if @webservice_user.has_password?(password)
              true
            else 
              false
            end
          end
        end
      end
    end
    
    
    def index_authenticate
      respond_to do |format|
        format.html { 
          deny_access unless signed_in?
        }
        
        format.xml { index_webservice_authenticate }
        format.json { index_webservice_authenticate }
      end
    end
    
    def index_webservice_authenticate
      authenticate_or_request_with_http_basic do |username, password|
        @webservice_user = User.find_by_email(username)
        if @webservice_user.has_password?(password)
          if signed_in?
            if current_user.id == @webservice_user.id
              true
            else
              sign_out
              sign_in(@webservice_user)
              true
            end
          else
            sign_in(@webservice_user)
            true
          end
        else
          false
        end
      end
    end
    
end
