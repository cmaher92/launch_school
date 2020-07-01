EMPTY_LINE = "     |     |     "
MID_LINE   = "_____|_____|_____"
 # "  %1$s  |  %2$s  |  %3$s  " % ['1', '2', '3']
marks = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

def display_board(marks)
  content = build_content_lines(marks)
  [
    EMPTY_LINE, content[0], MID_LINE,
    EMPTY_LINE, content[1], MID_LINE,
    EMPTY_LINE, content[2], EMPTY_LINE
  ].each { |line| puts line }
end

def build_content_lines(marks)
  content = []
  3.times { content << "  %1$s  |  %2$s  |  %3$s  " % marks.shift(3) }
  content
end

display_board(marks)
