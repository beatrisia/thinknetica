fibonacci = [0]
element = 1

while element < 100 do
  fibonacci.push(element)
  element = fibonacci[-1] + fibonacci[-2]
end

puts fibonacci

=begin

fibonacci = [0, 1]

loop do
  element = fibonacci[-1] + fibonacci[-2]
  break if element >= 100
  fibonacci.push(element)
end

puts fibonacci

---

puts fibonacci

fibonacci = []

a = 0
b = 1

while a < 100 do
  fibonacci << a
  a,b = b,a+b
end

puts fibonacci

=end
