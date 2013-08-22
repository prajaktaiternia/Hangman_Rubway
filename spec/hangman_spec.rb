require './hangman'

describe Hangman do
     subject(:hangman){Hangman.new('elephantisis')}

     it "should accept only one alphabet from user"
     it "it should accept one alphabet only"

  context "#initialize" do
      it "counter should be zero" do
        expect(hangman.counter).to eq(0)
      end

      it "counter should not be writable" do
        expect {hangman.counter=10}.to raise_error NoMethodError
      end

      it "word_placeholder should be array of '_' " do
         expect(hangman.word_placeholder).to eq(['_']*12)
      end

      it "word_placeholder length should be length of the word"  do
        expect(hangman.word_placeholder.length).to eq(12)
      end

      it "missed_counter should be zero" do
        expect(hangman.missed_counter).to eq(0)
      end


      it " wrong_choices should be empty array " do
        expect(hangman.wrong_choices).to eq([])
      end

  end

  context  "hangman for correct choice" do

  end

  context "hangman for incorrect choice" do

  end

  context "check for repeated characters" do

  end

  context "result" do
    context "win" do

    end

    context "lose" do

    end

  end
end