# frozen_string_literal: true

require_relative 'path_tracker'
require 'benchmark'

input_path = File.join(__dir__, 'input.txt')
directions = File.read(input_path).strip

house_grid = PathTracker.new(directions)
puts house_grid.houses_visited_count
puts "day 1 part 1 : #{house_grid.houses_visited_count}"

puts(Benchmark.measure { house_grid.houses_visited_count }) # 0.003268s
