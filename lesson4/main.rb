require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'

stations = []
trains = []
routes = []
cars = []

action = 0
while action != "exit" do
puts "What would you like to do?"
action = gets.chomp

if action == "Create a station"
  puts "Enter station:"
  station = gets.chomp
  puts "Enter station's name:"
  stations_name = gets.chomp
  station = Station.new(stations_name)
  stations << station
  puts "The station created"

elsif action == "Create a train"
  puts "Enter train's name:"
  train = gets.chomp
  puts "Enter train's number:"
  number = gets.chomp
  puts "Enter train's type:"
  type = gets.chomp
  if type == "passenger"
    train = PassengerTrain.new(number, type)
    trains << train
  elsif type == "cargo"
    train = CargoTrain.new(number, type)
    trains << train
  end
  puts "The train created"

elsif action == "Create a route"
  puts "Enter route's name"
  route = gets.chomp
  puts "Enter departure station:"
  departure_station = gets.chomp
  puts "Enter arrival_station:"
  arrival_station = gets.chomp
  route = Route.new(stations[stations.index(departure_station)], stations[stations.index(arrival_station)])
  routes << route
  puts "The route created"

elsif action == "Attach a route to a train"
  puts "Enter the train:"
  train = gets.chomp
  puts "Enter the route:"
  route = gets.chomp
  trains[trains.index(train)].route(routes[routes.index(train)])
  puts "#{route} has been attached to #{train}"

elsif action == "Add a car to a train"
  puts "Enter the train:"
  train = gets.chomp
  puts "Enter the car:"
  car = gets.chomp
  puts "Enter car's type:"
  type = gets.chomp
  if type == "passenger"
    car = PassengerCar.new(type = "passenger")
    train.add_car(car)
  elsif type == "cargo"
    car = CargoCar.new(type = "cargo")
    train.add_car(car)
  end
    puts "#{car} has been added to #{train}"

elsif action == "Delete a car from a train"
  puts "Enter the train:"
  train = gets.chomp
  puts "Enter the car:"
  car = gets.chomp
  train.delete(car)
  puts "#{car} has been deleted from #{train}"

elsif action == "Move forward"
  puts "Enter the train:"
  train = gets.chomp
  train.forward
  puts "The train has been moved to #{train.current_station}"

elsif action == "Move backward"
  puts "Enter the train:"
  train = gets.chomp
  train.backward
  puts "The train has been moved to #{train.current_station}"

elsif action == "View the stations"
  puts = "Enter the route:"
  route = gets.chomp
  route.stations

elsif action == "View the trains"
  puts "Enter the station:"
  station = gets.chomp
  station.trains

elsif action == "exit"
  puts "Good bye!"
end
end




