class Deck < ActiveRecord::Base

  has_many :sentences

  def retrieve
    sentence = nil
    until sentence && !sentence.modified
      sentence = self.sentences.sample
      sentence = sentence if !sentence.modified
    end
    sentence
  end

  def complete(args)
    sentence = args[:sentence]
    first_word = args[:first_word]
    second_word = args[:second_word]
    third_word = args[:third_word]
    case sentence.blank_count
    when 0
      p "We should probably destroy sentence #{sentence}"
    when 1
      sentence.original.sub("_", first_word)
    when 2
      sentence.original.sub("_", second_word)
    when 3
      sentence.original.sub("_", third_word)
    end
  end

  def count_blanks
    self.sentences.each do |sentence|
      sentence.blank_count = sentence.original.count('_')
      sentence.save
    end
    # need to delete sentences where blank_count is 0
  end

end
