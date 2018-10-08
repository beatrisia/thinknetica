names_hash = {}
sum_hash = {}

loop do
puts "Введите название товара"
name = gets.chomp

break if name.downcase == "stop"

puts "Введите цену товара"
price = gets.to_i

puts "Введите количество товара"
quantity = gets.to_f

names_hash[name] = { price => quantity }
sum_hash[name] = price * quantity

end

puts names_hash
puts sum_hash
puts sum_hash.values.sum
