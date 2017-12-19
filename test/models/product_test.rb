require "test_helper"

describe Product do
  let(:product) { Product.new }

  it "must be valid" do
    value(product).must_be :valid?
  end
end
