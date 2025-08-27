# frozen_string_literal: true

require_relative 'wrapping_paper_calculator'
require 'benchmark'

input_path = File.join(__dir__, 'input.txt')
dimensions = File.read(input_path).strip

wrapping_paper_calc = WrappingPaperCalculator.new(dimensions, 'x')

puts "day 2 part 1 : #{wrapping_paper_calc.square_feet_of_paper}"
puts "day 2 part 2 : #{wrapping_paper_calc.square_feet_of_ribon}"

puts(Benchmark.measure { wrapping_paper_calc.square_feet_of_paper }) # 0.001346s
puts(Benchmark.measure { wrapping_paper_calc.square_feet_of_ribon }) # 0.000361s
