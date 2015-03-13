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
      puts sentence.original.sub("_", first_word)
    when 2
      replaced = sentence.original.sub("_", first_word)
      modified = replaced.sub("_", second_word)
      puts modified
    when 3
      replaced = sentence.original.sub("_", first_word)
      replaced_again = replaced.sub("_", second_word)
      modified = replaced_again.sub("_", third_word)
      puts modified
    end
  end

  def count_blanks
    self.sentences.each do |sentence|
      sentence.blank_count = sentence.original.count('_')
      sentence.save
    end
  end

  def add_blanks
    # add "_" to sentences with blank_count of 0
  end

end
