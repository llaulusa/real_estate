class PropertiesController < ApplicationController
  before_action :find_property, only: [:show, :edit, :update, :destroy, :sell]
  before_action :find_user, only: [:create, :new]
  def index
    @properties_for_sale = Property.where(status: 1)
  	@properties_sold = Property.where(status: 2)
  end

  def show
  end

  def new
  	@property = Property.new
  end

  def create
  	@property = Property.new(property_params)
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

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  def sell
    # TODO better way to do this
    if @property.update(sell_property)
      redirect_to property_path(@property.id)
    else
    end
  end


  private
  	def property_params
  		params.require(:property).permit(:price, :street, :city, :state, :zip, :status, :buyer_id)

  	end
    def sell_property
      {status:2, buyer_id: current_user.id  }
    end

  	def find_user
  		@user =User.find(current_user)
  	end

  	def find_property
  		@property = Property.find(params[:id])
  	end
end
