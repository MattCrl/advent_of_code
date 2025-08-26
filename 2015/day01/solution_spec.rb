# frozen_string_literal: true

require_relative 'solution'
require 'rspec'

RSpec.describe 'Advent of Code Day 1' do
  it 'runs examples for part 1' do
    expect(FloorCalculator.new('(', ')', '()').calculate_floor).to eq(0)
    expect(FloorCalculator.new('(', ')', '(())').calculate_floor).to eq(0)
    expect(FloorCalculator.new('(', ')', '))(((((').calculate_floor).to eq(3)
    expect(FloorCalculator.new('(', ')', '())').calculate_floor).to eq(-1)
    expect(FloorCalculator.new('(', ')', '))(').calculate_floor).to eq(-1)
    expect(FloorCalculator.new('(', ')', ')()(').calculate_floor).to eq(0)
  end

  it 'runs examples for part 2' do
    expect(FloorCalculator.new('(', ')', '())').first_basement_position).to eq(3)
    expect(FloorCalculator.new('(', ')', ')').first_basement_position).to eq(1)
    expect(FloorCalculator.new('(', ')', '((((())))))').first_basement_position).to eq(11)
  end
end
