class PropertiesController < ApplicationController
  before_aciton :find_property, only: [:show, :edit, :update, :destroy]
  before_aciton :find_user, only: [:create, :new]
  def index
  	@properties = Property.all
  end

  def show 
  	
  end

  def new
  	@property =Property.new
  end
  def create
  	@property =Property.new(property_params)
  	@user << @property
  	if @user.save
  		redirect_to user_property(@property.id)
  	else
  		render :new
  	end
  end

  def edit

  end

  def update
  	
  end

  private
  	def property_params
  		params.require(:property).permit(:price, :street, :city, :state, :zip, :status, :buyer_id)
  		
  	end

  	def find_user
  		@user =User.find(params[:user_id])
  	end

  	def find_property
  		@property = Property.find(params[:id])
  	end
end
