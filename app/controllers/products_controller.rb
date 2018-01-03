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
      Product.add_ingredient(product)
      render json: product, status: :created
    else
      render json: {errors: product.errors.messages}, status: :bad_request
    end
  end

  def search
    # limit = params[:limit] || 10
    # page = params[:page] || 1
    # offset = ((page.to_i - 1) * limit.to_i) || 0
    # .limit(limit).offset(offset)

    products = Product.search(params[:q])

    render json: products, status: :ok
  end

  private

  def product_params
    params.permit(:brand, :name, :ingredients)
  end
end
