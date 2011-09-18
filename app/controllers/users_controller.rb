class UsersController < ApplicationController
  before_filter :authenticate, :only => [:show, :edit, :update]
  before_filter :correct_user, :only => [:show, :edit, :update]
  
  def show
    @user = User.find(params[:id])
    
  end

  def new
    @user = User.new
    
  end
  
  def create
    @user = User.new(params[:user])
    @user.date_joined = Date.today
    
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else  
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    
  end

  private
  
    def authenticate
       deny_access unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      if current_user != @user
        flash[:error] = "Permissions Denied!"
        redirect_to(root_path)
      end
    end

end
