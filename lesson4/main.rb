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
  puts "Enter the station:"
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
    train = PassengerTrain.new(number)
    trains << train
  elsif type == "cargo"
    train = CargoTrain.new(number)
    trains << train
  end
  puts "The train created"

elsif action == "Create a route"
  puts "Enter route name"
  route = gets.chomp
  puts "Enter route number"
  number = gets.chomp
  puts "Enter departure station's name:"
  dep_station_name = gets.chomp
  departure_station = stations.find { |station| station.name == dep_station_name }
  puts "Enter arrival_station's name'"
  ar_station_name = gets.chomp
  arrival_station = stations.find { |station| station.name == ar_station_name }
  route = Route.new(number, departure_station, arrival_station)
  routes << route
  puts "The route created."

elsif action == "Create a car"
  puts "Enter car name:"
  car = gets.chomp
  puts "Enter car number"
  number = gets.chomp
  puts "Enter car type:"
  type = gets.chomp
  if type == "passenger"
    car = PassengerCar.new(number)
    cars << car
  elsif type == "cargo"
    car = CargoCar.new(number)
    cars << car
  end
  puts "The car has been created"

elsif action == "Attach a route to a train"
  puts "Enter train number"
  train_number = gets.chomp
  train = trains.find { |train| train.number == train_number }
  puts "Enter route number"
  route_number = gets.chomp
  route = routes.find { |route| route.number == route_number }
  train.route(route)
  puts "#{route} has been attached to #{train}"

elsif action == "Add a car to a train"
  puts "Enter train number"
  train_number = gets.chomp
  train = trains.find { |train| train.number == train_number }
  puts "Enter car number:"
  car_number = gets.chomp
  car = cars.find { |train| car.number == car_number }
  if train.type == car.type
    train.add_car(car)
    puts "#{car} has been added to #{train}"
  else
    puts "The car and the train must have the same type."
  end

elsif action == "Delete a car from a train"
  puts "Enter train number"
  train_number = gets.chomp
  train = trains.find { |train| train.number == train_number }
  puts "Enter car number:"
  car_number = gets.chomp
  car = cars.find { |train| car.number == car_number }
  if train.cars.include?(car)
    train.delete(car)
    puts "#{car} has been deleted from #{train}"
  else
    puts "#{train} doesn't have this car"
  end

elsif action == "Move forward"
  puts "Enter train number"
  train_number = gets.chomp
  train = trains.find { |train| train.number == train_number }
  train.forward
  puts "The train has been moved to #{train.current_station}"

elsif action == "Move backward"
  train_number = gets.chomp
  train = trains.find { |train| train.number == train_number }
  train.backward
  puts "The train has been moved to #{train.current_station}"

elsif action == "View the stations"
  puts = "Enter the route number"
  route_number = gets.chomp
  route = routes.find { |route| route.number == route_number }
  route.stations

elsif action == "View the trains"
  puts "Enter the station name"
  station_name = gets.chomp
  station = stations.find { |station| station.name == station_name }
  station.trains

elsif action == "exit"
  puts "Good bye!"
end
end




