require 'pry'

def who_is_winner(moves)
  ConnectFour.winner(moves)
end

# ...

class ConnectFour
  COLUMNS = %w[A B C D E F G].freeze
  COLUMN_COUNT = 7

  class << self
    def winner(moves)
      new(moves).winner
    end

    private :new
  end

  def initialize(moves)
    @columns = empty_columns.freeze
    @moves = parse_moves(moves)
  end

  def winner
    
    moves.each do |col_name, color|
      col_i, row_i = drop_piece(col_name, color)
      possible_paths(col_i, row_i).any? do |path|
        return color if connect?(path, color)
      end
    end

    'Draw'
  end

  private

  attr_reader :columns, :moves

  def drop_piece(col_name, color)
    col = COLUMNS.index(col_name)
    columns[col] << color
    [col, columns[col].size - 1]
  end

  def possible_paths(col, row)
    search_paths.map do |path|
      path.map do |position|
        [position.first + col, position.last + row]
      end
    end.select(&method(:valid_path?))
  end

  def valid_path?(path)
    path.all? do |pos|
      pos.min >= 0 && columns[pos.first]&.dig(pos.last)
    end
  end

  def search_paths
    result = [[0, 1], [1, 1], [1, 0], [1, -1]].flat_map do |dir|
      (-3..0).map do |offset|
        (offset..offset + 3).map do |step|
          [dir.first * step, dir.last * step]
        end
      end
    end
    binding.pry 
  end

  def connect?(path, color)
    path.all? do |pos|
      columns[pos.first][pos.last] == color
    end
  end

  def parse_moves(moves)
    moves.map { |move| move.split('_') }
  end

  def empty_columns
    Array.new(COLUMN_COUNT) { [] }
  end
end

  pieces_position_list = [
  "C_Yellow",
  "E_Red",
  "G_Yellow",
  "B_Red",
  "D_Yellow", 
  "B_Red",
  "B_Yellow",
  "G_Red",
  "C_Yellow",
  "C_Red",
  "D_Yellow",
  "F_Red",
  "E_Yellow",
  "A_Red",
  "A_Yellow",
  "G_Red",
  "A_Yellow",
  "F_Red",
  "F_Yellow",
  "D_Red",
  "B_Yellow",
  "E_Red",
  "D_Yellow",
  "A_Red",
  "G_Yellow",
  "D_Red",
  "D_Yellow",
  "C_Red"]

who_is_winner(pieces_position_list)