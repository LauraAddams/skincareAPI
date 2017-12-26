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
        ingredient_array = Ingredient.first.ingredient.split(",").map(&:strip)
        all = Ingredient.first

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

  def search
    limit = params[:limit] || 10
    page = params[:page] || 1
    offset = ((page.to_i - 1) * limit.to_i) || 0

    q = params[:q].downcase || nil
    products = []
    products = Product.where('name LIKE ? '\
      'OR brand LIKE ? '\
      'OR ingredients LIKE ?', "%#{q}%", "%#{q}%", "%#{q}%").limit(limit).offset(offset) if q
    render json: products, status: :ok
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
