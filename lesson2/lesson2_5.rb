puts "День рождения"
day = gets.chomp.to_i
puts "Месяц рождения"
month = gets.chomp.to_i
puts "Год рождения"
year = gets.chomp.to_i

leap_year = {
  january: 31,
  february: 29,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31
}

ordinary_year = {
  january: 31,
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31
}

if year % 100 == 0
	puts "ordinary year"
elsif year % 400 == 0 || year % 4 == 0
	puts "leap year"
else
	puts "ordinary year"
end

