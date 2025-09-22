# frozen_string_literal: true

require 'benchmark'
require_relative 'light_switcher'
require_relative 'better_light_switcher'

input_path = File.join(__dir__, 'input.txt')
commands = File.read(input_path).strip
grid = Array.new(1000) { Array.new(1000, 0) }

light_grid = LightSwitcher.new(grid, commands)
light_grid.process_commands_part1
puts light_grid.lit_lights_count

puts "day 6 part 1 : #{light_grid.lit_lights_count}"

puts(Benchmark.measure { 
  light_grid = LightSwitcher.new(grid, commands)
  light_grid.process_commands_part1
  light_grid.lit_lights_count
}) # 4.114391s

# Better solution by asking Gemini some help to reduce my manual previous solution :
# Using "numo-narray" Ruby gem to manipulate N-dimensional Array way faster
commands_string = File.read(input_path).strip

better_light_grid = BetterLightSwitcher.new(commands_string)
better_light_grid.process_commands_part1
puts "day 6 part 1 (better) : #{better_light_grid.lit_lights_count}"
puts(Benchmark.measure { 
  better_light_grid = BetterLightSwitcher.new(commands_string)
  better_light_grid.process_commands_part1
  better_light_grid.lit_lights_count
}) # 0.024536s

# Part 2 :
better_light_grid_p2 = BetterLightSwitcher.new(commands_string)
better_light_grid_p2.process_commands_part2
puts "day 6 part 2 (better) : #{better_light_grid_p2.lit_lights_count}"
puts(Benchmark.measure { 
  better_light_grid_p2 = BetterLightSwitcher.new(commands_string)
  better_light_grid_p2.process_commands_part2
  better_light_grid_p2.lit_lights_count
}) # 0.035674s
