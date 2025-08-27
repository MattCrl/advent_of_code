# frozen_string_literal: true

require_relative 'solution'
require 'rspec'

RSpec.describe 'Advent of Code Day 2' do
  it 'runs examples for part 1' do
    expect(WrappingPaperCalculator.new('2x3x4', 'x').square_feet_of_paper).to eq(58)
    expect(WrappingPaperCalculator.new('1x1x10', 'x').square_feet_of_paper).to eq(43)
  end

  it 'runs examples for part 2' do
    expect(WrappingPaperCalculator.new('2x3x4', 'x').square_feet_of_ribon).to eq(34)
    expect(WrappingPaperCalculator.new('1x1x10', 'x').square_feet_of_ribon).to eq(14)
  end
end
