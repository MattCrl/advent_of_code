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

  private

  def one_gift_paper_size(length, width, height)
    smallest_side = [length * width, width * height, height * length].min
    (2 * length * width) + (2 * width * height) + (2 * height * length) + smallest_side
  end
end
