class Controller
  def initialize(args)
    @view = args[:view].new
    @collection = args[:collection].first
  end

  def play
    until @collection.sentences.all? { |sentence| sentence.modified == true }
      sentence = @collection.retrieve
      first_word = nil
      second_word = nil
      third_word = nil
      case sentence.blank_count
      when 1
        @view.ask_for_word
        first_word = gets.chomp
        break if first_word == "exit"
        @collection.complete(sentence: sentence, first_word: first_word)
        @view.newline
      when 2
        @view.ask_for_word
        first_word = gets.chomp
        break if first_word == "exit"
        @view.ask_for_another_word
        second_word = gets.chomp
        break if second_word == "exit"
        @collection.complete(sentence: sentence, first_word: first_word, second_word: second_word)
        @view.newline
      when 3
        @view.ask_for_word
        first_word = gets.chomp
        break if first_word == "exit"
        @view.ask_for_another_word
        second_word = gets.chomp
        break if second_word == "exit"
        @view.ask_for_another_word
        third_word = gets.chomp
        break if third_word == "exit"
        @collection.complete(sentence: sentence, first_word: first_word, second_word: second_word, third_word: third_word)
        @view.newline
      end
    end
  end

end




