# frozen_string_literal: true

require_relative 'dial'
require 'benchmark'

input_path = File.join(__dir__, 'input.txt')
rotations = File.read(input_path).strip.split("\n")

dial = Dial.new((0..99).to_a, 50, rotations)
puts dial.calculate_password
