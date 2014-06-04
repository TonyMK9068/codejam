class TestFileReader

  attr_reader :file_name, :content, :known_words, :samples, :tokens

  def initialize(file)
    @file_name = file
    self.parse
  end

  def parse
    alien_lang = File.open(@file_name, 'r') do |f|
      @tokens, @d, @n = f.gets.chomp.split.collect { |x| x.to_i }
      @content = []
      while line = f.gets
        @content << line.chomp
      end
    end
  end

  def known_words
    @known_words ||= @content[0, @d]
  end

  def samples
    @samples ||= @content[@d, @n]
  end
end

