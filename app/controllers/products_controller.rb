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
      ingredient_array = product.ingredients.downcase.split(",").map(&:strip)

      ingredient_array.each do |i|
        if Ingredient.where('ingredient LIKE ? ', "%#{i}%").count == 0
          new = Ingredient.new
          new.ingredient = i
          new.save
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

    q = (params[:q].downcase || nil).split(' ')
    products = []

    products = Product.where("concat_ws(' ', brand, name, ingredients) ILIKE ?", "%#{q[0]}%") if q.length

    if q.length > 1
      i = 1
      (q.length - 1).times do
        products = products.select do |object|
          (object.brand.include? q[i]) || (object.name.include? q[i]) || (object.ingredients.include? q[i])
        end
        i += 1
      end
    end

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
