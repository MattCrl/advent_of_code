# frozen_string_literal: true

require_relative 'nice_string_finder'
require 'benchmark'

input_path = File.join(__dir__, 'input.txt')
strings = File.read(input_path).strip

nice_string_finder_p1 = NiceStringFinder.new(strings, 3)

puts "day 5 part 1 : #{nice_string_finder_p1.check_all_requirements?}"

puts(Benchmark.measure { nice_string_finder_p1.check_all_requirements? }) # 0.001248s
