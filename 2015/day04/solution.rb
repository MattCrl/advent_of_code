# frozen_string_literal: true

require_relative 'hash_miner'
require 'benchmark'

hash_mine_p1 = HashMiner.new('iwrupvqb', '0', 5)
hash_mine_p2 = HashMiner.new('iwrupvqb', '0', 6)

puts "day 4 part 1 : #{hash_mine_p1.find_nonce}"
puts "day 4 part 2 : #{hash_mine_p2.find_nonce}"

puts(Benchmark.measure { hash_mine_p1.find_nonce }) # 0.174185s
puts(Benchmark.measure { hash_mine_p2.find_nonce }) # 4.992205s
