# Banner Class

require 'pry'

class Banner
  def initialize(message, width=nil)
    @message = message
    @width = calculate_width(width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def calculate_width(width)
    # width must be last than the width of the terminal and greater than message
    if width.nil?
      @widdth = @message.size
    elsif width > ENV["COLUMNS"].to_i || width < @message.size
      @width = @message.size
    else
      @width = width
    end
  end

  def empty_line
    "| #{' ' * (@width)} |"
  end

  def horizontal_rule
    "+-#{'-' * (@width)}-+"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# banner = Banner.new('')
# puts banner

banner = Banner.new('Connor', 2)
puts banner
