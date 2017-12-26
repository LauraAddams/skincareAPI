class Product < ApplicationRecord
  validates :brand, presence: true
  validates_format_of :brand, :with => /\A[^<>~!$;=?@`|{}]+\z/, :on => :create, :message => 'Contains an invalid symbol <>~!$;=?@`|{}'
  validates :name, presence: true
  validates_format_of :name, :with => /\A[^<>~!$;=?@`|{}]+\z/, :on => :create, :message => 'Contains an invalid symbol <>~!$;=?@`|{}'
  validates :ingredients, presence: true
  validates_format_of :ingredients, :with => /\A[^<>~!$;=?@`|{}]+\z/, :on => :create, :message => 'Contains an invalid symbol <>~!$;=?@`|{}'

  private

  def ingredient_list
    self.ingredients = self.ingredients.split(",").map(&:strip)
  end
end
