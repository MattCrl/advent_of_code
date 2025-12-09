# frozen_string_literal: true

class Dial
  def initialize(dial_numbers, starting_position, rotations)
    @dial_numbers = dial_numbers
    @starting_position = starting_position
    @rotations = rotations
  end

  def calculate_password_part1
    size = @dial_numbers.size
    current_position = @starting_position
    @rotations.count do |rotation|
      rotate = rotation[1..-1].to_i
      if rotation.start_with?("L")
        current_position = (current_position - rotate) % size
      elsif rotation.start_with?("R")
        current_position = (current_position + rotate) % size
      end
      current_position == 0
    end
  end

  def calculate_password_part2
    size = @dial_numbers.size
    current_position = @starting_position
    total = 0
    @rotations.each do |rotation|
      rotate = rotation[1..-1].to_i
      laps_number, shift_remaining = rotate.divmod(size)
      total += laps_number
      if rotation.start_with?("L")
        if current_position > 0 && shift_remaining >= current_position
          total += 1 
        end
        current_position = (current_position - shift_remaining) % size
      elsif rotation.start_with?("R")
        if current_position + shift_remaining >= size
          total += 1
        end
        current_position = (current_position + shift_remaining) % size
      end
    end
    total
  end
end
