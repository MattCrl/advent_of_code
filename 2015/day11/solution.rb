# frozen_string_literal: true

require_relative 'password'

forbidden_letters = %w[i o l]
forbidden_words = "abcdefghijklmnopqrstuvwxyz".chars.each_cons(3).map(&:join)

password = Password.new(forbidden_letters, forbidden_words, "hxbxwxba")

puts password.find_next_valid_password # p1
puts password.find_next_valid_password # p2
