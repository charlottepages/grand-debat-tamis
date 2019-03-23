require 'json'

namespace :import do
  task marked_ideas: :environment do
    Answers.destroy_all


    filepath = "#{Dir.pwd}/db/data/input.json"
    serialized_ideas = File.read(filepath)
    ideas = JSON.parse(serialized_ideas)


  end
end













require_relative '../models/car'
require_relative '../models/rental'
require_relative '../models/option'
require 'json'

class RentalRepository
  attr_reader :rentals

  def initialize(filepath)
    @data = data(filepath)
    @rentals = generate
  end

  private

  def generate
    cars = @data[:cars].map { |car| Car.new(car) }
    validate_ids(cars)

    rentals = @data[:rentals].map do |rental|
      rental[:car] = cars.select { |car| car.id == rental[:car_id] }.first
      Rental.new(rental)
    end
    validate_ids(rentals)

    @data[:options].each do |option|
      rental = rentals.select { |r| r.id == option[:rental_id] }.first
      rental.options << Option.new(id: option[:id], type: option[:type])
      validate_ids(rental.options)
    end

    rentals
  end

  def data(filepath)
    serialized_data = File.read(filepath)
    JSON.parse(serialized_data, symbolize_names: true)
  end
