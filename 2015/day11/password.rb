# frozen_string_literal: true

class Password
  attr_reader :forbidden_letters, :forbidden_words, :password

  def initialize(forbidden_letters, forbidden_words, password)
    @forbidden_letters = forbidden_letters
    @forbidden_words = forbidden_words
    @password = password
  end

  def find_next_valid_password
    password_is_invalid = true

    while password_is_invalid
      @password = @password.next
      if @forbidden_words.any? { |word| @password.include?(word) } && !(@forbidden_letters.any? { |word| @password.include?(word) }) && (@password.scan(/(.)\1/).uniq.count > 1)
        password_is_invalid = false
      end
    end

    @password
  end
end
