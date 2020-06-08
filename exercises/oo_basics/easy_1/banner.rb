class Banner
  def initialize(message, width)
    @message = message
    @width   = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_reader :message, :width

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

banner = Banner.new('skylar is so pretty', 30)
puts banner
