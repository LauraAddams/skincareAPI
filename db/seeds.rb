require 'csv'

ASIAN_BEAUTY1 = Rails.root.join('db', 'seed_data', 'AB1.csv')
ASIAN_BEAUTY2 = Rails.root.join('db', 'seed_data', 'AB2.csv')
PRODUCT1 = Rails.root.join('db', 'seed_data', 'Prod1.csv')
PRODUCT2 = Rails.root.join('db', 'seed_data', 'Prod2.csv')
RED1 = Rails.root.join('db', 'seed_data', 'red1.csv')

CSV_FILES = [ASIAN_BEAUTY1, ASIAN_BEAUTY2, PRODUCT1, PRODUCT2, RED1]

CSV_FILES.each do |file_name|
  puts "#{file_name}"

  failures = []

  CSV.foreach(file_name, :headers => true) do |row|
    product = Product.new
    product.brand = row['brand']
    product.name = row['product_name']
    product.ingredients = row[2..-1].join(',')

    successful = product.save
    if !successful
      failures << product
    end
  end
end
