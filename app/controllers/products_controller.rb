class ProductsController < ApplicationController

  # def getIngredients
  #   products = products.all
  #
  #   newProds = products.each do |prod|
  #     prod.ingredients = prod.ingredients.split(',')
  #   end
  # end

  def index
    products = Product.all

    render(
      json: products.as_json(methods: :ingredient_list, only: [:brand, :name]), status: :ok
    )
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
