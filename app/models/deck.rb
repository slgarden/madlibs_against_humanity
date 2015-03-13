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

  def complete(word)
  end

  def display
  end

end
