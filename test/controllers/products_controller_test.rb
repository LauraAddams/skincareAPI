require "test_helper"

describe ProductsController do
  describe 'index' do
    before do
      get products_url
    end

    it 'is a real working route' do
      must_respond_with :success
    end

    it 'returns json' do
      response.header['Content-Type'].must_include 'json'

      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    it 'returns all products' do
      body = JSON.parse(response.body)
      body.length.must_equal Product.count
    end

    it "returns products with exactly the required fields" do
      keys = %w(brand id ingredient_list name)
      body = JSON.parse(response.body)
      body.each do |product|
        product.keys.sort.must_equal keys
      end
    end

    it "returns an empty array if there are no products" do
      Product.destroy_all
      get products_url
      must_respond_with :success
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
      body.must_be :empty?
    end
  end

  describe 'show' do
    before do
      get product_path(products(:one).id)
    end

    it 'can get a single product' do
      must_respond_with :success
    end

    it 'returns an error if product is invalid' do
      products(:one).destroy()
      get product_path(products(:one).id)
      must_respond_with :not_found
    end
  end

  describe 'create' do
    let(:product_data) {
      {  brand: 'Generic',
        name: 'Jojoba Oil',
        ingredients: 'Jojoba oil'
      }
    }

    it 'can create a new product' do
      assert_difference 'Product.count', 1 do
        post products_url, params: product_data
        assert_response :success
      end

      body = JSON.parse(response.body)
      body.must_be_kind_of Hash
      body.must_include "id"

      Product.find(body["id"]).name.must_equal product_data[:name]
    end

    it 'returns errors for invalid products' do
      bad_data = product_data.clone()
      bad_data.delete(:name)
      assert_no_difference "Product.count" do
        post products_url, params: bad_data
        assert_response :bad_request
      end

      body = JSON.parse(response.body)
      body.must_be_kind_of Hash
      body.must_include "errors"
      body["errors"].must_include "name"
    end
  end
end
