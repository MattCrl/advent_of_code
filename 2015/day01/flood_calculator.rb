# frozen_string_literal: true

class FloorCalculator
  attr_reader :up_char, :down_char, :directions

  def initialize(up_char, down_char, directions)
    @up_char = up_char
    @down_char = down_char
    @directions = directions
  end

  def calculate_floor
    directions.count(up_char) - directions.count(down_char)
  end

  def first_basement_position
    actual_floor = 0
    i = 0
    while actual_floor > -1
      actual_floor += directions[i] == up_char ? 1 : -1
      i += 1
    end
    i
  end
end
