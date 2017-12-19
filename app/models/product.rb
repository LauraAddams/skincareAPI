class Product < ApplicationRecord
  validates :name, presence: true

  private

  def ingredient_list
    self.ingredients = self.ingredients.split(",").map(&:strip)
  end
end
