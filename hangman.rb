class Hangman

 attr_reader :counter
 attr_reader :word_placeholder
 attr_reader :missed_counter
 attr_reader :wrong_choices

  def initialize(word)
     @counter=0
     @word_placeholder=['_']*word.length
    @missed_counter=0
    @wrong_choices=[]

  end
end