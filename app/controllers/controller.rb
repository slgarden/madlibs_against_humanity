require_relative "../models/sentence"
require_relative "../models/view"


class Controller < ActiveRecord::Base
  def self.play(sentence)
    until modified == true
      sentence.retrieve
      p "Press Enter twice to leave the game"
      blank_count.times do
        input == gets.chomp
      end
      View.display_one
      if input == nil
        break
      end
    end
  end
end

# Controller.play(Sentence.new(file_name))
