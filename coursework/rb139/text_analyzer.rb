class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

anal = TextAnalyzer.new
anal.process { |data| puts "#{data.split("\n\n").count} paragraphs" }
anal.process { |data| puts "#{data.split("\n").count} lines" }
anal.process { |text| puts "#{text.split(' ').count} words"}
