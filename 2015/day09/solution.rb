# frozen_string_literal: true
require_relative 'distance_map'
require_relative 'route'

input_path = File.join(__dir__, 'input.txt')
entries = File.read(input_path).strip.split("\n")

distance_map = DistanceMap.from_entries(entries)

# p1
min_distance = distance_map.cities.permutation.map do |way|
  Route.new(way, distance_map).total_distance
end.min

# p2
max_distance = distance_map.cities.permutation.map do |way|
  Route.new(way, distance_map).total_distance
end.max

puts min_distance # p1
puts max_distance # p2
