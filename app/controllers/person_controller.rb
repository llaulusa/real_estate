class PersonController < ApplicationController
  def index
  	@persons = User.all
  end

  def show
  	@person = User.find(params[:id])
  	@properties = @person.properties
  end
end
