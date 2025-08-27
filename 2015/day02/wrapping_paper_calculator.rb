# frozen_string_literal: true

class WrappingPaperCalculator
  attr_reader :dimensions, :dimensions_separator

  def initialize(dimensions, dimensions_separator)
    @dimensions = dimensions
    @dimensions_separator = dimensions_separator
  end

  def square_feet_of_paper
    total_paper_needed = 0
    dimensions.split("\n").map do |one_gift_size|
      l, w, h = one_gift_size.split('x').map &:to_i
      total_paper_needed += one_gift_paper_size(l, w, h)
    end
    total_paper_needed
  end

  def square_feet_of_ribon
    total_ribon_needed = 0
    dimensions.split("\n").map do |one_gift_size|
      l, w, h = one_gift_size.split('x').map &:to_i
      smallest_size_perimeter = [(l * 2) + (w * 2), (w * 2) + (h * 2), (h * 2) + (l * 2)].min
      total_ribon_needed += smallest_size_perimeter + (l * w * h)
    end
    total_ribon_needed
  end

  private

  def one_gift_paper_size(length, width, height)
    smallest_side_area = [length * width, width * height, height * length].min
    (2 * length * width) + (2 * width * height) + (2 * height * length) + smallest_side_area
  end
end
