class Api::TypesController < ApplicationController

  def index
    @types = Type.all
    render json: {message: "THIS IS TYPES!"}
  end

end
