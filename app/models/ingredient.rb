class Ingredient < ApplicationRecord
  validates :ingredient, presence: true
end
