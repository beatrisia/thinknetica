puts "День рождения"
day = gets.to_i
puts "Месяц рождения"
month = gets.to_i
puts "Год рождения"
year = gets.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months[1] = 29 if year % 400 == 0 || year % 4 == 0 && year % 100 != 0

days = months.take(month - 1).inject(day, :+) + day
puts days
