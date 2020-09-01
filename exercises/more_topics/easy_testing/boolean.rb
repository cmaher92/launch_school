require 'minitest/autorun'

value = 10
test = Minitest::Test.new
test.assert value.odd?, 'value is not odd'