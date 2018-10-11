products = {}

loop do
  puts "Введите название товара"
  name = gets.chomp

  break if name.downcase == "stop"

  puts "Введите цену товара"
  price = gets.to_i

  puts "Введите количество товара"
  quantity = gets.to_f

  products[name] = {price: price, quantity: quantity}
end

puts products

total_sum = 0

products.each do |product, sum|
  product_sum = sum[:price] * sum[:quantity]
  total_sum += product_sum
  puts "#{product} = #{product_sum}"
end

puts total_sum

