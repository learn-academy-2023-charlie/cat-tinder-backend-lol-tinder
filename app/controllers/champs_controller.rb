class ChampsController < ApplicationController
    def index
    champs = Champ.all
    render json: champs
    end

    def create
    champ = Champ.create(cat_params)
    if champ.valid?
      render json: champ
    else
      render json: cat.errors, status: 422
    end
    end

  def update
  end

  def destroy
    champ = Champ.find(params[:id])
    champ.destroy
    head :no_content
  end

  private
  def champ_params
    params.require(:champ).permit(:name, :age, :ability, :image)
  end
end
