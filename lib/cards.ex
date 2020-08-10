defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
   Returns a list of strings representing a deck of playing cards.
  """
  def create_hand(hand_size) do
    # the first argument is implicit passed for next function call
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines wheter a deck contains a given card

    ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
   Divides a deck into a hand and the remainder of the deck.
   The `hand_size` argument indicates how many cards should
   be in the hand.

   ## Examples
      iex> deck  = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Spades", "Two of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    # erlang has tremendous name of methods
    # term_to_bin converts the file in to something that can be read by FILE module
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      # symbol -> atom
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end
end
