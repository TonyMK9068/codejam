require_relative '../lib/alien_language'

describe AlienLanguage do
  let(:test_language) do
    known_words = %w{azb zfz akf aas}
    pattern = %w{(az)zb a(zfska)s zfz taz}
    test_language = AlienLanguage.new(3, known_words, test_language)
  end

  describe "#word_count" do
    it "returns the number of known words known to exist for the instance" do
      test_language.word_count.should ==  4
    end
  end

  describe "#possible_matches_for(sample)" do
    it "returns number of possible words the supplied argument can be a match for" do
      test_language.possible_matches_for('(az)zb').should == 1
    end

    it " " do
      test_language.possible_matches_for('(az)(akfz)(bsz)').should == 3
    end

    it "returns nil if no possible matches are found for given argument" do
      test_language.possible_matches_for('taz').should == 0
    end
  end

  # describe "#total_matches" do
  #   it "returns an array of total matches for each sample or test" do
  #     stub_test_lang :stub :samples => %w{map (az)zb}, word
  #   end
  # end
end