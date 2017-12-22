class Ingredient < ApplicationRecord
  validates :ingredient, presence: true

  private

  def all_ingredients
    self.ingredient = self.ingredient.split(",").map(&:strip)
  end
end
