fibonacci = [0, 1]

loop do
element = fibonacci[-1] + fibonacci[-2]
fibonacci.push(element)
break if element >= 100
end

puts fibonacci

=begin

fibonacci = []

a = 0
b = 1

while a < 100 do
  fibonacci << a
  a,b = b,a+b
end

puts fibonacci

=end
