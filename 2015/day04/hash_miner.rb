# frozen_string_literal: true

class HashMiner
  require 'digest'
  attr_reader :secret_key, :searched_char, :searched_count

  def initialize(secret_key, searched_char, searched_count)
    @secret_key = secret_key
    @searched_char = searched_char
    @searched_count = searched_count
  end

  def find_nonce
    i = 0
    count_found = false
    until count_found
      i += 1
      count_found = true if Digest::MD5.hexdigest("#{secret_key}#{i}").start_with?(searched_char * searched_count)
    end
    i
  end

  def find_nonce_optimized
    i = 0
    md5 = Digest::MD5.new
    target = searched_char * searched_count

    loop do
      i += 1
      md5.reset
      md5 << secret_key
      md5 << i.to_s

      return i if md5.hexdigest.start_with?(target)
    end
  end
end
