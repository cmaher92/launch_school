require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.new('sample_text.txt')

    @data = File.read('sample_text.txt').chomp
    @text = Text.new(@data)
  end

  def test_swap
    data_swapped = @data.gsub('a', 'e')
    assert_equal data_swapped, @text.swap('a', 'e')
  end

  def test_word_count
    text = Text.new(@file.read.chomp)
    assert_equal @data.split.count, text.word_count
  end

  def teardown
    @file.close
  end
end
