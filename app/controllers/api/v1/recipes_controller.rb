class Api::V1::RecipesController < Api::V1::ApiController
  def show
    recipe = Recipe.find(params[:id])

    render status: 200, json: recipe
  end
end