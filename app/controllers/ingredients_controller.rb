class IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.all

    render(
      json: ingredients,
      status: :ok
    )
  end
end
