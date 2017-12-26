class IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.all

    render(
      json: ingredients,
      status: :ok
    )
  end

  def search
    limit = params[:limit] || 10
    page = params[:page] || 1
    offset = ((page.to_i - 1) * limit.to_i) || 0

    q = params[:q].downcase || nil
    ingredients = []
    ingredients = Ingredient.where('ingredient LIKE ? ', "%#{q}%").limit(limit).offset(offset) if q
    render json: ingredients, status: :ok
  end
end
