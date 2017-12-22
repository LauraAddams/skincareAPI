class ProductsController < ApplicationController

  def index
    products = Product.all

    render(
      json: products.as_json(methods: :ingredient_list, only: [:brand, :name]), status: :ok
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
      render json: product, status: :ok
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
