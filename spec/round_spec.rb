require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
end

  it 'has a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it 'has no turns initiated yet' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

# describe '#current_card' do (end)
  it 'has a current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it 'initiates new turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    # what is a turn?
    expect(new_turn.guess).to eq("Juneau")
    expect(new_turn.card).to eq(card_1)
    expect(new_turn.class).to eq(Turn) # new_turn is part of the Turn class
    expect(new_turn.correct?).to eq(true)
    expect(round.turns[0].guess).to eq("Juneau")
    expect(round.turns[0].card).to eq(card_1)
    expect(round.number_correct).to eq(1)
    expect(round.current_card).to eq(card_2)     # not (deck.cards[1]) because after you rotate deck the cards change positions and [1] doesn't equal card_2 anymore
  end

    it 'goes to next card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      turn_2 = round.take_turn("Venus")

      expect(turn_2.guess).to eq("Venus")
      expect(turn_2.card).to eq(card_2)
      expect(round.turns.count).to eq(2)
      expect(round.turns.last.feedback).to eq("Incorrect.")
      expect(round.number_correct).to eq(1)
      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
      expect(round.percent_correct).to eq(50.0)
      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    end


    # it 'goes to next card' do
    #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #   deck = Deck.new([card_1, card_2, card_3])
    #   round = Round.new(deck)
    #   new_turn = round.take_turn("Juneau")
    #   turn_2 = round.take_turn("Venus")
    #   turn_3 = round.take_turn("North north west")
    #
    #     expect(turn_3.guess).to eq("North north west")
    #     expect(turn_3.card).to eq(card_2)
    #     expect(round.turns.count).to eq(2)
    #     expect(round.turns.last.feedback).to eq("Incorrect.")
    #     expect(round.number_correct).to eq(1)
    #     expect(round.number_correct_by_category(:Geography)).to eq(1)
    #     expect(round.number_correct_by_category(:STEM)).to eq(0)
    #     expect(round.percent_correct).to eq(50.0)
    #     expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    #   end



  end
