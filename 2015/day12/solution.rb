require_relative 'document_analyzer'

input_path = File.join(__dir__, 'input.txt')
json_document = File.read(input_path)

document_analyzer = DocumentAnalyzer.new(json_document)

puts document_analyzer.sum_all_numbers
