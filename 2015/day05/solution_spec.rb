# frozen_string_literal: true

require 'rspec'
require_relative 'nice_string_finder'

input_path = File.join(__dir__, 'input_spec_p1.txt')
strings = File.read(input_path).strip

input_path_p2 = File.join(__dir__, 'input_spec_p2.txt')
strings_p2 = File.read(input_path_p2).strip

RSpec.describe 'Advent of Code Day 5' do
  it 'runs examples for part 1' do
    expect(NiceStringFinder.new(strings, 3).check_all_requirements?).to eq(2)
  end

  it 'runs examples for part 2' do
    expect(NiceStringFinder.new(strings_p2, 3).check_better_requirements?).to eq(2)
  end
end
