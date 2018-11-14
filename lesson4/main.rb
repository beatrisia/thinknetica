require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'

class Main

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @cars = []
  end

  def run
    action = 0
    while action < 12 do
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
      action = gets.to_i
      actions(action)
    end
  end

private

  def actions(action)
    if action == 1
      create_station
    elsif action == 2
      create_train
    elsif action == 3
      create_route
    elsif action == 4
      create_car
    elsif action == 5
      attach_route
    elsif action == 6
      add_car
    elsif action == 7
      delete_car
    elsif action == 8
      move_forward
    elsif action == 9
      move_backward
    elsif action == 10
      view_stations
    elsif action == 11
      view_trains
    elsif action == 12
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
    else
      puts "Enter passenger or cargo type."
    end
    puts "The train has been created."
  end

  def create_route
    puts "Enter route number:"
    route_number = gets.chomp
    puts "Enter departure station:"
    dep_station = gets.chomp
    departure_station = @stations.find { |station| station.name == dep_station }
    if departure_station
      puts "Enter arrival station:"
      ar_station = gets.chomp
      arrival_station = @stations.find { |station| station.name == ar_station }
      add_route
    else
      puts "There is no such station."
    end
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
    else
      puts "Enter passenger or cargo type."
    end
    puts "The car has been created."
  end

  def attach_route
    train = find_train
    route = find_route
    if train && route
      train.route(route)
      puts "Route #{route.number} has been attached to train #{train.number}."
    else
      puts "There is no such train or route."
    end
  end

  def add_car
    train = find_train
    car = find_car
    if train && car
      add_car_condition
    else
      puts "There is no such train or car."
    end
  end

  def delete_car
    train = find_train
    car = find_car
    if train && car
      delete_car_condition
    else
      puts "There is no such train or car."
    end
  end

  def move_forward
    train = find_train
    route = find_route
    if train
      if train.current_station != route.last_station
        train.forward
        puts "The train has been moved to #{train.current_station.name}."
      else
        puts "The train is on the last station."
      end
    else
      puts "There is no such train."
    end
  end

  def move_backward
    train = find_train
    route = find_route
    if train
      if train.current_station != route.first_station
        train.backward
        puts "The train has been moved to #{train.current_station.name}."
      else
        puts "The train is on the first station."
      end
    else
      puts "There is no such train."
    end
  end

  def view_stations
    route = find_route
    if route
      route.stations.each { |station| puts station.name }
    else
      puts "There is no such route."
    end
  end

  def view_trains
    station = find_station
    if station
      station.trains.each { |train| puts "train #{train.number}" }
    else
      puts "There is no such station."
    end
  end

  def exit
    puts "Good bye!"
  end

  def find_train
    puts "Enter train number:"
    train_number = gets.chomp
    @trains.find { |train| train.number == train_number }
  end

  def find_car
    puts "Enter car number:"
    car_number = gets.chomp
    @cars.find { |car| car.number == car_number }
  end

  def find_route
    puts "Enter route number:"
    route_number = gets.chomp
    @routes.find { |route| route.number == route_number }
  end

  def find_station
    puts "Enter station's name:"
    station_name = gets.chomp
    @stations.find { |station| station.name == station_name }
  end

  def add_route
    if arrival_station
      route = Route.new(route_number, departure_station, arrival_station)
      @routes << route
      puts "The route has been created."
    else
      puts "There is no such station."
    end
  end

  def add_car_condition
    if train.type == car.type
      train.add_car(car)
      puts "Car #{car.number} has been added to train #{train.number}."
    else
      puts "The car and the train must have the same type."
    end
  end

  def delete_car_condition
    if train.cars.include?(car)
      train.delete_car(car)
      puts "Car #{car.number} has been deleted from #{train.number}."
    else
      puts "Train #{train.number} doesn't have car #{car.number}"
    end
  end
end

main = Main.new
main.run





