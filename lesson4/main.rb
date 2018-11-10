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
  @stations = []
  @trains = []
  @routes = []
  @cars = []
end

def run
  @action = 0
  while @action < 12 do
    puts "Menu"
    puts "What would you like to do? Enter the number:"
    puts "1 Create a station"
    puts "2 Create a train"
    puts "3 Create a route"
    puts "4 Create a car"
    puts "5 Attach a route to the train"
    puts "6 Add a car to the train"
    puts "7 Delete a car from the train"
    puts "8 Move forward"
    puts "9 Move backward"
    puts "10 View the stations"
    puts "11 View the trains"
    puts "12 Exit"
    @action = gets.to_i
    actions
  end
end

private

def actions
  if @action == 1
    create_station
  elsif @action == 2
    create_train
  elsif @action == 3
    create_route
  elsif @action == 4
    create_car
  elsif @action == 5
    attach_route
  elsif @action == 6
    add_car
  elsif @action == 7
    delete_car
  elsif @action == 8
    move_forward
  elsif @action == 9
    move_backward
  elsif @action == 10
    view_stations
  elsif @action == 11
    view_trains
  elsif @action == 12
    exit
  end
end

def create_station
  puts "Enter station name:"
  station_name = gets.chomp
  station = Station.new(station_name)
  @stations << station
  puts "The station has been created."
end

def create_train
  puts "Enter train number:"
  train_number = gets.chomp
  puts "Enter train type:"
  type = gets.chomp
  if type == "passenger"
    train = PassengerTrain.new(train_number)
    @trains << train
  elsif type == "cargo"
    train = CargoTrain.new(train_number)
    @trains << train
  end
  puts "The train has been created."
end

def create_route
  puts "Enter route number:"
  route_number = gets.chomp
  puts "Enter departure station name:"
  dep_station_name = gets.chomp
  departure_station = @stations.find { |station| station.name == dep_station_name }
  puts "Enter arrival station name:"
  ar_station_name = gets.chomp
  arrival_station = @stations.find { |station| station.name == ar_station_name }
  route = Route.new(route_number, departure_station, arrival_station)
  @routes << route
  puts "The route has been created."
end

def create_car
  puts "Enter car number"
  car_number = gets.chomp
  puts "Enter car type:"
  type = gets.chomp
  if type == "passenger"
    car = PassengerCar.new(car_number)
    @cars << car
  elsif type == "cargo"
    car = CargoCar.new(car_number)
    @cars << car
  end
  puts "The car has been created."
end

def attach_route
  train_number
  route_number
  @train.route(@route)
  puts "#{@route} has been attached to #{@train}."
end

def add_car
  train_number
  car_number
  if @train.type == @car.type
    @train.add_car(@car)
    puts "#{@car} has been added to #{@train}."
  else
    puts "The car and the train must have the same type."
  end
end

def delete_car
  train_number
  car_number
  if @train.cars.include?(@car)
    @train.delete_car(@car)
    puts "#{@car} has been deleted from #{@train}."
  else
    puts "#{@train} doesn't have this car."
  end
end

def move_forward
  train_number
  @train.forward
  puts "The train has been moved to #{@train.current_station}."
end

def move_backward
  train_number
  @train.backward
  puts "The train has been moved to #{@train.current_station}."
end

def view_stations
  route_number
  @route.stations
end

def view_trains
  station_name
  @station.trains
end

def exit
  puts "Good bye!"
end

def train_number
  puts "Enter train number:"
  @train_number = gets.chomp
  @train = @trains.find { |train| train.number == @train_number }
end

def car_number
  puts "Enter car number:"
  @car_number = gets.chomp
  @car = @cars.find { |car| car.number == @car_number }
end

def route_number
  puts = "Enter route number:"
  @route_number = gets.chomp
  @route = @routes.find { |route| route.number == @route_number }
end

def station_name
  puts "Enter station's name:"
  @station_name = gets.chomp
  @station = @stations.find { |station| station.name == @station_name }
end
end

main = Main.new
main.run





