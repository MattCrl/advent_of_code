# frozen_string_literal: true

class Dial
  def initialize(dial_numbers, starting_position, rotations)
    @dial_numbers = dial_numbers
    @starting_position = starting_position
    @rotations = rotations
  end

  def calculate_password
    current_dial = @dial_numbers.dup
    @rotations.count do |rotation|
      rotate = rotation[1..-1].to_i
      if rotation.start_with?("L")
        current_dial = current_dial.rotate(-rotate)
      elsif rotation.start_with?("R")
        current_dial = current_dial.rotate(rotate)
      end
      current_dial[@starting_position] == 0
    end
  end
end
