# frozen_string_literal: true

require 'rspec'
require_relative 'solution'

RSpec.describe 'Advent of Code Day 4' do
  it 'runs examples for part 1' do
    expect(HashMiner.new('abcdef', '0', 5).find_nonce).to eq(609_043)
    expect(HashMiner.new('pqrstuv', '0', 5).find_nonce).to eq(1_048_970)
  end

  it 'runs examples for part 2' do
    # no examples given for part 2
  end
end
