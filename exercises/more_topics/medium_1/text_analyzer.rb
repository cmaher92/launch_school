class TextAnalyzer
  def process
    # your implementation
    file = File.open('sample_text.txt')
    yield(file.readlines.map(&:chomp))
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process do |txt|
  p txt
end
# analyzer.process { # your implementation }
# analyzer.process { # your implementation }

# 3 paragraphs
# 15 lines
# 126 words
