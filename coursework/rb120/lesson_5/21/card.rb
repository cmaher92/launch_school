module Twenty_one
  class Card
    attr_reader :value

    def initialize(face, suit)
      @face = face
      @suit = suit
      @value = calc_value
    end

    def high_ace?
      @face == 'A'
    end

    def hide
      @hidden = true
      self
    end
    
    def reveal
      @hidden = false
      self
    end

    def hidden?
      !!@hidden
    end

    def displayable
      if !hidden?
        [
        ["┌────────┐"],
        ["│#{@face.ljust(2)}      │"],
        ["│        │"],
        ["│   #{emojify_suit}    │"],
        ["│        │"],
        ["│      #{@face.rjust(2)}│"],
        ["└────────┘"]
        ]
      else
        ['┌','│','│','│','│','│','└']
      end
    end

    private

    def calc_value
      case
      when ('2'..'10').include?(@face) then @face.to_i
      when ['J', 'Q', 'K'].include?(@face) then 10
      when 'A' == @face then 11
      end
    end

    def emojify_suit
      case @suit
      when 'Hearts' then "\u{2665}"
      when 'Spades' then "\u{2660}"
      when 'Diamonds' then "\u{2666}"
      when 'Clubs' then "\u{2663}"
      end
    end
  end
end

# card1 = Twenty_one::Card.new('10', 'Hearts')
# card2 = Twenty_one::Card.new('A', 'Diamonds')
# puts "#{card1.to_s} #{card2.to_s}"
