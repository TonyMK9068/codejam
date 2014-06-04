require_relative '../lib/test_file_reader.rb'

describe "TestFileReader" do
  let(:test_file_reader) do
    test_file_reader = TestFileReader.new('test.txt')
  end

  # describe "#parse" do
  #   it "saves the contents of "
  # end

  describe "#known_words" do
    it "is an array of all known words from read file" do
      test_file_reader.known_words.should =~ %w{abc bca dac dbc cba}
    end
  end

  describe "#samples" do
    it "returns all known samples" do
      test_file_reader.samples =~ %w{(ab)(bc)(ca) abc (abc)(abc)(abc) (zyx)bc}
    end
  end
  
end