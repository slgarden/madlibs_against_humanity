class Controller
  def initialize(args)
    @view = args[:view].new
    @model = args[:model]
    @collection = args[:collection].first
  end

  def play
    until @collection.sentences.all? { |sentence| sentence.modified == true } == true
      sentence = @collection.retrieve
      case sentence.blank_count
      when 1
        puts sentence.blank_count
        puts "Please enter a word:" # this should also be in view
        first_word = gets.chomp
        @collection.complete(sentence: sentence, first_word: first_word)
        @view.newline
      when 2
        puts sentence.blank_count
        puts "Please enter a word:" # this should also be in view
        first_word = gets.chomp
        puts "Please enter a word:" # this should also be in view
        second_word = gets.chomp
        @collection.complete(sentence: sentence, first_word: first_word, second_word: second_word)
        @view.newline
      when 3
        puts sentence.blank_count
        puts "Please enter a word:" # this should also be in view
        first_word = gets.chomp
        puts "Please enter a word:" # this should also be in view
        second_word = gets.chomp
        puts "Please enter a word:" # this should also be in view
        third_word = gets.chomp
        @collection.complete(sentence: sentence, first_word: first_word, second_word: second_word, third_word: third_word)
        @view.newline
      end
    end
  end
  # def play
  #   until @model.modified == true
  #     @deck.retrieve
  #     puts "Press Enter twice to leave the game" # needs to be in view
  #     @model.blank_count.times do
  #       puts "Please enter a word:" # this should also be in view
  #       input = gets.chomp
  #     end
  #     @view.display_one
  #     if input == nil
  #       break
  #     end
  #   end
  # end
end

# Controller.play(Sentence.new(file_name))


# until every sentence in the collection has a modified value of true, play the game
  # retrieve a sentence
  # set the sentence to a variable
  # if the blank_count is 1, ask the user for one word
  # if the blank_count is 2, ask the user for two words
  # if the blank_count is 3, ask the user for three words
  # send the sentence and the user generated words to the complete method


