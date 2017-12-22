require "test_helper"

describe Ingredient do
  let(:ingredient) { Ingredient.new }

  it "must be valid" do
    value(ingredient).must_be :valid?
  end
end
