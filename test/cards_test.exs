defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck = Cards.create_deck()
    deck_length = length(deck)
    assert deck_length == 20
  end

  test "create_deck makes 20 different cards" do
    deck = Cards.create_deck()
    deck_length = length(deck)
    assert length(Enum.uniq(deck)) == deck_length
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
  end
end
