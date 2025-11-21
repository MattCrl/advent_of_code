# frozen_string_literal: true

require_relative 'look_and_say'
require 'benchmark'

# p1
look_and_say = LookAndSay.new("1113222113")
look_and_say.play_game(40)

puts look_and_say.input.length

# p2
look_and_say_p2 = LookAndSay.new("1113222113")
look_and_say_p2.play_game(50)

puts look_and_say_p2.input.length

look_and_say = LookAndSay.new("1113222113")
look_and_say_p2 = LookAndSay.new("1113222113")
puts(Benchmark.measure { look_and_say.play_game(40) }) # 0.316360s
puts(Benchmark.measure { look_and_say_p2.play_game(50) }) # 4.605511s
