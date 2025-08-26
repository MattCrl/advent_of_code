# frozen_string_literal: true

require_relative 'flood_calculator'
require 'benchmark'

input_path = File.join(__dir__, 'input.txt')
directions = File.read(input_path).strip

floor_calculator = FloorCalculator.new('(', ')', directions)
puts "day 1 part 1 : #{floor_calculator.calculate_floor}"
puts "day 1 part 2 : #{floor_calculator.first_basement_position}"

puts(Benchmark.measure { floor_calculator.calculate_floor }) # 0.000004s
puts(Benchmark.measure { floor_calculator.first_basement_position }) # 0.000104s
