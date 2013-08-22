require './hangman'

describe Hangman do
     subject(:hangman){Hangman.new('elephantisis')}


     context "input_character" do



       context "alphabet_check" do

         it "it should accept alphabet only" do
           hangman.guess_input='ee'
           expect(hangman.guess_input.match(/^[[:alpha:]]+$/).nil? ).to eq(false)
         end
       end

       context "input_one" do

          it "should accept only one character from user" do
            hangman.guess_input='a'
            expect(hangman.guess_input.length).to eq(1)

          end
        end

       context "input_multiple" do

         it "should accept multiple characters from user" do
           hangman.guess_input='elephantisis'
           expect(hangman.guess_input).to eq('word')
         end
       end

     end

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


     context "playgame" do
       context  "correct_choice" do
         it "should be check previous counter and increment counter" do
                expect(hangman.counter).should=+1
         end
       end

       context "incorrect_choice" do
         it "should be increment missed_counter" do
              expect(hangman.missed_counter).should=+1
         end
       end

       context "repeated_characters" do
         it "should be check entered existing character" do
            expect(hangman.repeated_choices).include?('guess_input')
           end
         end
     end


  context "result" do
    context "win" do
       it "should be counter 12" do
         expect(hangman.counter).to eq(12)
       end
    end

    context "lose" do
      it "should be counter 6" do
        expect(hangman.counter).to eq(6)
      end
    end

  end
end