# frozen_string_literal: true

require_relative 'solution'
require 'rspec'

RSpec.describe 'Advent of Code Day 3' do
  it 'runs examples for part 1' do
    expect(PathTracker.new('>').houses_visited_count).to eq(2)
    expect(PathTracker.new('^>v<').houses_visited_count).to eq(4)
    expect(PathTracker.new('^v^v^v^v^v').houses_visited_count).to eq(2)
  end

  it 'runs examples for part 2' do
    expect(PathTracker.new('^v').houses_with_santa_robo).to eq(3)
    expect(PathTracker.new('^>v<').houses_with_santa_robo).to eq(3)
    expect(PathTracker.new('^v^v^v^v^v').houses_with_santa_robo).to eq(11)
  end
end
