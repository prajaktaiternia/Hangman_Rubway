require './hangman'

describe Hangman do
  subject(:hangman) { Hangman.new('elephantisis') }

  context "#initialize" do
    it "counter should be zero" do
      expect(hangman.counter).to eq (0)
    end
    it "counter should not be writable" do
      expect{hangman.counter = 10}.to raise_error NoMethodError
    end
    it "word_placeholder should be array of '_'" do
      expect(hangman.word_placeholder).to eq (['_']*12)
    end
    it "word_placeholder length should be of the word" do
      expect(hangman.word_placeholder.length).to eq(12)
    end
    it "missed_counter should be 0" do
      expect(hangman.missed_counter).to eq(0)
    end
    it "missed_counter should not be writable" do
      expect{hangman.missed_counter = 10}.to raise_error NoMethodError
    end
    it "repeated_choices should be empty array" do
      expect(hangman.repeated_choices).to eq([])
    end
  end

  context "user_input" do
    it "user input should accept only alphabet" do
      hangman.guess_input = 'q'
      #expect(hangman.guess_input).match(/^[[:alpha:]]$/)
      expect(hangman.guess_input.match(/^[[:alpha:]]+$/).nil? ).to eq(false)
    end

    it "user input should accept only 1 character" do
      hangman.guess_input = 'a'
      expect(hangman.guess_input.length).to eq(1)
    end

    it "user input should accept multiple characters" do
      hangman.guess_input = 'word'
      expect(hangman.guess_input).to eq('word')
    end
  end

  context "#play_game" do
    context "correct_choice" do
      it"input character should be included in word" do
        # position = 2
        hangman.guess_input = 'e'
        hangman.play_game
        hangman.word_placeholder.index('e').should_not == nil
        #expect(hangman.word_placeholder[position] = guess_input)
      end
      it "counter should get incremented by no. of times characters present" do
        hangman.guess_input = 'e'
        temp = hangman.counter
        hangman.play_game
        (hangman.counter - temp).should == 2
      end
    end

    context "for wrong choice" do
      it"input character should not be included in word" do
        hangman.guess_input = 'z'
        expect(hangman.word_placeholder.index('z')).to eq (nil)
      end
      it "missed counter should get incremented by 1" do
        hangman.guess_input = 'q'
        temp = hangman.missed_counter
        hangman.play_game
        (hangman.missed_counter - temp).should == 1
      end
    end

    context "for repeated characters" do
      it"check if user entered already existing characters" do
        #expect(hangman.repeated_choices).include?('guess_input')
        hangman.guess_input = 'i'
        temp = hangman.counter
        hangman.play_game
        (hangman.counter - temp).should == 2
      end
    end
  end

  context "result" do
    context "win" do
      it "counter should be 12" do
        expect(hangman.counter).to eq (12)
      end
    end

    context "lose" do
      it "missed_counter should be 6" do
        expect(hangman.missed_counter).to eq(6)
      end
    end
  end

end