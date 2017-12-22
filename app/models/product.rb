class Product < ApplicationRecord
  validates :name, presence: true
  validates :ingredients, presence: true

  private

  def ingredient_list
    self.ingredients = self.ingredients.split(",").map(&:strip)
  end
end
