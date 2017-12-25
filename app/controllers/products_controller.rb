class ProductsController < ApplicationController

  def index
    products = Product.all

    render(
      json: products,
      status: :ok
    )
  end

  def show
    product = Product.find_by(id: params[:id])

    if product
      render json: product, status: :ok
    else
      render json: { ok: false }, status: :not_found
    end
  end

  def create
    product = Product.create(product_params)

    if product.valid?
      new_ing_array = product.ingredients.downcase.split(",").map(&:strip)

      new_ing_array.each do |i|
        ingredient_array = Ingredient.find(1).ingredient.split(",").map(&:strip)
        all = Ingredient.find(1)

        if ingredient_array.exclude? i
          all.ingredient << ',' + i
          all.save
        end

      end
      render json: product, status: :created
    else
      render json: {errors: product.errors.messages}, status: :bad_request
    end
  end

  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

  private

  def product_params
    params.permit(:brand, :name, :ingredients)
  end
end
