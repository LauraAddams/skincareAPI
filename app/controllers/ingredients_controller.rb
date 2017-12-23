class IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.find(1).ingredient.split(",").map(&:strip)

    render(
      json: ingredients.as_json(), status: :ok
    )
  end
end
