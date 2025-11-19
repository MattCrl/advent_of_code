require_relative 'string_calculator'

input_path = File.join(__dir__, 'input.txt')
lines = File.read(input_path).strip.split("\n")

inputs = StringCalculator.new(lines)
inputs.calculate_escaped_chars
