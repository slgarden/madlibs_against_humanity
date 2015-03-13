
madlibs_against_humanity = Deck.create

file = File.open("cards_against_sentences.txt")
file.each do |line|
  stripped_line = line.rstrip
  madlibs_against_humanity.sentences << Sentence.create(original: stripped_line, modified: false)
end

madlibs_against_humanity.
