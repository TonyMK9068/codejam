class AlienLanguage
  
  attr_reader :words, :samples, :tokens
  
  def initialize(tokens, words=[], samples=[])
    @tokens = tokens
    @words = words
    @samples = samples
  end

  def word_count
    @words.length
  end

  def possible_matches_for(sample)
    sample = sample.gsub('(', '[').gsub(')', ']')
    regexp_sample = Regexp.new sample
    num_of_matches = 0
    @words.each do |word|
      num_of_matches += 1 if word.match regexp_sample
    end
    num_of_matches
  end

  def total_matches
    my = self
    @samples.collect do |test|
      my.possible_matches_for(test)
    end
  end
end