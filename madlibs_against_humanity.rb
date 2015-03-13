require_relative 'config/application'

# controller initialization code


deck = Deck.first

# deck.retrieve

# deck.count_blanks


# p deck.complete(sentence: Sentence.find(16), first_word: "ballsack")

controller = Controller.new(
  collection: Deck,
  view: View
)

controller.play
