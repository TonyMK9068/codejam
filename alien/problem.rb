require_relative 'lib/test_file_reader'
require_relative 'lib/alien_language'

language_file = TestFileReader.new('alien_text_large.in')
alien_language = AlienLanguage.new(language_file.tokens, language_file.known_words, language_file.samples)
File.open("results.txt", "w") do |file|
  alien_language.total_matches.each_with_index do |result, index|
    file.puts "Case ##{index + 1}: #{result}"
  end
end

puts "Test Complete"