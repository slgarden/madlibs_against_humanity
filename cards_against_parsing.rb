
cards = []

file = File.open("cards_against_sentences.txt")
file.each do |line|
  stripped_line = line.rstrip
  cards << stripped_line
end
