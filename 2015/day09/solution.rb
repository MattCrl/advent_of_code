# frozen_string_literal: true
require_relative 'distance_map'
require_relative 'route'

input_path = File.join(__dir__, 'input.txt')
entries = File.read(input_path).strip.split("\n")

distance_map = DistanceMap.from_entries(entries)

min_distance = distance_map.cities.permutation.map do |way|
  Route.new(way, distance_map).total_distance
end.min

puts min_distance
