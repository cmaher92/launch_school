# Tic tac toe notes

## Game loop current logic
- init is_a_match
  - boolean
  - calls ask_if_match? to prompt user
- init score
  - hash

  game loop
  - init board
    - hash
  - init player_first
  - init player_first
    - based on constant WHOS_FIRST
      - if 'Player'
        - assigns 'Player'
      - if 'Computer'
        - assigns 'Computer'
      - else
        - assigns return value of #ask_whos_first
  - init current_player

    turn loop
    - #display_board
    - #display_score, if is_a_match
    - #place_piece!
    - reassign current_player to return value of #alternate_player
    - break if #someone_won? or #board_full?

  game loop continued
  - #display_board
  - if #someone_won?
    - init winner
    - display winner
    - #update_score!
  - else
    it's a tie

  - if it's a match
    - display_score
    - break if someone won the match
    - sleep(2)

  - ask to play again