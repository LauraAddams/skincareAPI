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

  def self.add_ingredient(product)
    ingredient_array = product.ingredients.downcase.split(",").map(&:strip)

    ingredient_array.each do |i|
      if Ingredient.where('ingredient LIKE ? ', "%#{i}%").count == 0
        new = Ingredient.new
        new.ingredient = i
        new.save
      end
    end
  end

  def self.search(q)
    q = (q.downcase || nil).split(' ')
    products = []

    products = Product.where("concat_ws(' ', brand, name, ingredients) ILIKE ?", "%#{q[0]}%") if q.length

    if q.length > 1
      i = 1
      (q.length - 1).times do
        products = products.select do |object|
          (object.brand.include? q[i]) || (object.name.include? q[i]) || (object.ingredients.include? q[i])
        end
        i += 1
      end
    end

    return products
  end
end # end of class
