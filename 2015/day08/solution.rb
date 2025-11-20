require_relative 'string_calculator'

input_path = File.join(__dir__, 'input.txt')
lines = File.read(input_path).strip.split("\n")

inputs_p1 = StringCalculator.new(lines)
inputs_p1.calculate_escaped_chars

inputs_p2 = StringCalculator.new(lines)
inputs_p2.calculate_escaped_chars_p2
