class ChampsController < ApplicationController
    def index
    champs = Champ.all
    render json: champs
    end

    def create
    champ = Champ.create(champ_params)
    if champ.valid?
      render json: champ
    else
      render json: champ.errors, status: 422
    end
    end

  def update
    champ = Champ.find(params[:id])
		champ.update(champ_params)
		render json: champ
	end

  def destroy
    champ = Champ.find(params[:id])
    champ.destroy
    head :no_content
    render json: champ
  end

  private
  def champ_params
    params.require(:champ).permit(:name, :age, :ability, :image)
  end
end
