# Assignment: Twenty-one

## Rules of 21
- 52 card deck
  - 4 suits (hearts, diamonds, clubs, and spades)
  - 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace)
- if you go over 21, it's a bust
- card values
  - 2-10 are face value
  - jack, queen, king are each worth 10
  - ace can be 1 or 11
    - ace's higher value is used unless the total is over 21
      - ace + 7 + 3 would be either 21 or 11, because the 11 value
        isn't over 21, that is used.
    - if there are multiple aces in a hand
      - A, A, 8
        - 10, or 20, or 30
        - when calculating choose the value

## Game setup
- consits of dealer and player
- each player is dealt two cards
  - the player can see their two cards
  - only can see one of the dealer's cards

## Data Type
card = {
  type: 'Ace'
  suit: 'Hearts'
  value: [1, 11]
}
deck - array of cards
hand - array of cards
  - players hand, dealers hand

## Methods
- calculate hand value
- compare hands
- display hand
- deal hands

## Game flow
- new_deck
- deal hands
- display player hand
- display dealer hand
- Player turn
  - hit
    - deal_card from deck
    - add to player hand
    - calculate hand
      - if bust, dealer wins, turn ends
  - stay
    - ends player's turn
- dealer turn
  - when the player stay's and doesn't bust
  - dealer must hit until the total is at least 17
  - if dealer busts, player wins
- compare cards
  - if both the dealer and player stay
  - compare cards
    - greatest value wins (up to 21 obv)