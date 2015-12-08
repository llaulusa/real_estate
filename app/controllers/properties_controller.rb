class PropertiesController < ApplicationController
  before_action :find_property, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:create, :new]
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
  	@property.user_id = @user.id
  	if @property.save
  		redirect_to property_path(@property.id)
  	else
  		render :new
  	end
  end

  def edit

  end

  def update
    if @property.update(property_params)
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  private
  	def property_params
  		params.require(:property).permit(:price, :street, :city, :state, :zip, :status, :buyer_id)
  		
  	end

  	def find_user
  		@user =User.find(current_user)
  	end

  	def find_property
  		@property = Property.find(params[:id])
  	end
end
