require "test_helper"

describe Ingredient do
  let(:ingredient) { Ingredient.new }
  let(:one) { ingredients(:one) }

  it 'must be valid' do
    one.valid?.must_equal true
  end

  it 'must have an ingredient' do
    ingredient.valid?.must_equal false
    ingredient.ingredient = 'Ingredient'
    ingredient.valid?.must_equal true
  end
end
