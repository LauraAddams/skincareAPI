require 'csv'

ASIAN_BEAUTY1 = Rails.root.join('db', 'seed_data', 'AB1.csv')
ASIAN_BEAUTY2 = Rails.root.join('db', 'seed_data', 'AB2.csv')
PRODUCT1 = Rails.root.join('db', 'seed_data', 'Prod1.csv')
PRODUCT2 = Rails.root.join('db', 'seed_data', 'Prod2.csv')
RED1 = Rails.root.join('db', 'seed_data', 'red1.csv')

CSV_FILES = [ASIAN_BEAUTY1, ASIAN_BEAUTY2, PRODUCT1, PRODUCT2, RED1]

# Product model seeds
CSV_FILES.each do |file_name|
  puts "products"
  puts "#{file_name}"

  failures = []

  CSV.foreach(file_name, :headers => true) do |row|
    product = Product.new
    product.brand = row['brand'].downcase
    product.name = row['product_name'].downcase
    product.ingredients = row[2..-1].join(',').downcase

    successful = product.save
    if !successful
      failures << product
    end
  end
end

# Ingredient model seeds
all_ingredients = []
failures = []

CSV_FILES.each do |file_name|
  puts "ingredients"
  puts "#{file_name}"

  CSV.foreach(file_name, :headers => true) do |row|
    p_ingredients = row[2..-1].join(',')
    p_ingredients = p_ingredients.split(",").map(&:strip)

    p_ingredients.each do |ingredient|
      all_ingredients << ingredient.downcase
    end
  end

  all_ingredients = all_ingredients.uniq
end

new = Ingredient.new
new.ingredient = all_ingredients.join(',')

successful = new.save
if !successful
  failures << new
end
