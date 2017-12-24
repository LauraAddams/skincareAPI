require "test_helper"

describe IngredientsController do
  before do
    get ingredients_url
  end

  it 'is a real working route' do
    must_respond_with :success
  end

  it 'returns json' do
    response.header['Content-Type'].must_include 'json'

    body = JSON.parse(response.body)
    body.must_be_kind_of Array
  end

  it 'returns all ingredients' do
    body = JSON.parse(response.body)
    body.length.must_equal Ingredient.count
  end

  it "returns an empty array if there are no products" do
    Ingredient.destroy_all
    get ingredients_url
    must_respond_with :success
    body = JSON.parse(response.body)
    body.must_be_kind_of Array
    body.must_be :empty?
  end
end
