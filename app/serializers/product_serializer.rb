class ProductSerializer < ActiveModel::Serializer
  attributes :id, :brand, :name, :ingredient_list
end
