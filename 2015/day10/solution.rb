# frozen_string_literal: true

require_relative 'look_and_say'

# p1
look_and_say = LookAndSay.new("1113222113")
look_and_say.play_game(40)

puts look_and_say.input.length

# p2
look_and_say = LookAndSay.new("1113222113")
look_and_say.play_game(50)

puts look_and_say.input.length
