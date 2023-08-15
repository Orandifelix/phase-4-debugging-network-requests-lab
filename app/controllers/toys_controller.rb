class ToysController < ApplicationController
  wrap_parameters format: []
  

  def index
    toys = Toy.all
    render json: toys
  end
# I rectified the create method  from Toys to Toy.create()
  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  #Added code  to capture  the  likes for updating  
  def update
    toy = Toy.find_by(id: params[:id])
    # toy.update(toy_params)
    if toy.update(likes: params[:likes])
      render json: toy
    else
      render json: { error: "Unable to update likes for the toy." }, status: :unprocessable_entity
    end
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
