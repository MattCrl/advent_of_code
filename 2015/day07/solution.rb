# frozen_string_literal: true

require_relative 'circuit'
require_relative 'instruction'
require_relative 'instructions'

# Part 1
input_path = File.join(__dir__, 'input.txt')
raw_orders = File.read(input_path).strip.split("\n")

circuit = Circuit.new(raw_orders)
final_signals = circuit.solve("a")
  
puts "Part 1 solution : #{final_signals}"

# Part 2
input_path_p2 = File.join(__dir__, 'input_p2.txt')
raw_orders_p2 = File.read(input_path_p2).strip.split("\n")

circuit_p2 = Circuit.new(raw_orders_p2)
final_signals_p2 = circuit_p2.solve("a")
  
puts "Part 2 solution : #{final_signals_p2}"
