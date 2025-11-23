# frozen_string_literal: true

class DocumentAnalyzer
  attr_reader :json_document

  def initialize(json_document)
    @json_document = json_document
  end

  def sum_all_numbers
    json_document.scan(/(-[\d]+|[\d]+)/).flatten.map(&:to_i).sum
  end
end
