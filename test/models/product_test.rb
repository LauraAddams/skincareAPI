require "test_helper"

describe Product do
  let(:product) {Product.new}
  let(:one) { products(:one) }

  it 'must be valid' do
    one.valid?.must_equal true
  end

  it 'must have a title, brand, and ingredients' do
    product.valid?.must_equal false
    product.brand = 'Brand'
    product.valid?.must_equal false
    product.name = 'Name'
    product.valid?.must_equal false
    product.ingredients = 'Ingredients'
    product.valid?.must_equal true
  end
end
