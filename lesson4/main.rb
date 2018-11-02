require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'

while gets.chomp != "exit" do
  puts "What would you like to do?" # write a cycle

if gets.chomp = "Create a station"
  puts "Enter station's name:"
  station = gets.chomp
  puts "Enter station's name:"
  stations_name = gets.chomp
  station = Station.new(stations_name)
  puts "The station created"

elsif gets.chomp = "Create a train"
  puts "Enter train's name:"
  train = gets.chomp
  puts "Enter train's number:"
  number = gets.chomp
  puts "Enter type:"
  train_type = gets.chomp
  train = Train.new(number, train_type)
  puts "The train created"

elsif gets.chomp = "Create a route"
  puts "Enter route's name"
  route = gets.chomp
  puts "Enter departure station:"
  departure_station = gets.chomp
  puts "Enter arrival_station:"
  arrival_station = gets.chomp
  route = Route.new(departure_station, arrival_station)
  puts "The route created"

elsif gets.chomp = "Attach a route to a train"
  puts "Enter the train:"
  train = gets.chomp
  puts "Enter the route:"
  route = gets.chomp
  train.route(route)
  puts "#{route} has been attachesd to #{train}"

elsif gets.chomp = "Add a car to a train"
  puts "Enter the train:"
  train = gets.chomp
  puts "Enter the car:"
  car = gets.chomp
  train.add_car(car)
  puts "#{car} has been added to #{train}"

elsif gets.chomp = "Delete a car from a train"
  puts "Enter the train:"
  train = gets.chomp
  puts "Enter the car:"
  car = gets.chomp
  train.delete(car)
  puts "#{car} has been deleted from #{train}"

elsif gets.chomp = "Move forward"
  puts "Enter the train:"
  train = gets.chomp
  train.forward
  puts "The train has been moved to #{train.current_station}"


elsif gets.chomp = "Move backward"
  puts "Enter the train:"
  train = gets.chomp
  train.backward
  puts "The train has been moved to #{train.current_station}"

elsif gets.chomp = "See the stations"
  puts = "Enter the route:"
  route = gets.chomp
  route.stations

elsif gets.chomp = "See the trains"
  puts "Enter the station:"
  station = gets.chomp
  station.trains

elsif gets.chomp = "exit"
  puts "Good bye!"
end
end




