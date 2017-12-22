class IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.all

    render(
      json: ingredients.as_json(methods: :all_ingredients), status: :ok
    )
  end
end
