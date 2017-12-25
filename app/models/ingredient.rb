class Ingredient < ApplicationRecord
  validates :ingredient, presence: true

  def all_ingredients
    self.ingredient = self.ingredient.split(",").map(&:strip).sort
  end
end
