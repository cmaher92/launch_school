require 'minitest/autorun'

class Test < Minitest::Test
  def test_equality
    value = 'XYZ'
    assert_equal 'xyz', value.downcase, "value was not 'xyz'"
  end
end