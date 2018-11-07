require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'

class Main

def initialize()
  stations = []
  trains = []
  routes = []
  cars = []
end

def run
action = 0
while action != "exit" do
puts "What would you like to do?"
action = gets.chomp
  if action == "Create a station"
    create_station
  elsif action == "Create a train"
    create_train
  elsif action == "Create a route"
    create_route
  elsif action == "Create a car"
    create_car
  elsif action == "Attach a route to a train"
    attach_route
  elsif action == "Add a car to a train"
    add_car
  elsif action == "Delete a car from a train"
    delete_car
  elsif action == "Move forward"
    move_forward
  elsif action == "Move backward"
    move_backward
  elsif action == "View the stations"
    view_stations
  elsif action == "View the trains"
    view_trains
  elsif action == "exit"
    exit
  end
end
end

private

def create_station
  puts "Enter the station:"
  station = gets.chomp
  puts "Enter station's name:"
  stations_name = gets.chomp
  station = Station.new(stations_name)
  stations << station
  puts "The station created"
end

def create_train
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
end

def create_route
  puts "Enter route name"
  route = gets.chomp
  puts "Enter route number"
  number = gets.chomp
  puts "Enter departure station's name:"
  dep_station_name = gets.chomp
  departure_station = stations.find { |station| station.name == dep_station_name }
  puts "Enter arrival_station's name'"
  ar_station_name = gets.chomp
  arrival_station = stations.find { |station| station.name == arr_station_name }
  route = Route.new(number, departure_station, arrival_station)
  routes << route
  puts "The route created."
end

def create_car
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
end

def attach_route
  train_number
  route_number
  train.route(route)
  puts "#{route} has been attached to #{train}"
end

def add_car
  train_number
  car_number
  if train.type == car.type
    train.add_car(car)
    puts "#{car} has been added to #{train}"
  else
    puts "The car and the train must have the same type."
  end
end

def delete_car
  train_number
  car_number
  if train.cars.include?(car)
    train.delete_car(car)
    puts "#{car} has been deleted from #{train}"
  else
    puts "#{train} doesn't have this car"
  end
end

def move_forward
  train_number
  train.forward
  puts "The train has been moved to #{train.current_station}"
end

def move_backward
  train_number
  train.backward
  puts "The train has been moved to #{train.current_station}"
end

def view_stations
  route_number
  route.stations
end

def view_trains
  station_name
  station.trains
end

def exit
  action == "exit"
  puts "Good bye!"
end

def train_number
  puts "Enter train number"
  train_number = gets.chomp
  train = trains.find { |train| train.number == train_number }
end

def car_number
  puts "Enter car number:"
  car_number = gets.chomp
  car = cars.find { |train| car.number == car_number }
end

def route_number
  puts = "Enter the route number"
  route_number = gets.chomp
  route = routes.find { |route| route.number == route_number }
end

def station_name
  puts "Enter the station name"
  station_name = gets.chomp
  station = stations.find { |station| station.name == station_name }
end
end

main = Main.new
main.run





