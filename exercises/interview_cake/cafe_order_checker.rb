# cafe order checker

# two registers
# one for take-out orders
# one for eating in
# both lists combined into a single list for the kitchen
# handled first come first serve (FIFO)

# write a method to check that my service is first come first serve
# all food should come out in the order that it was requested
# each customer represented by unique integer

# true
# Take Out Orders: [17, 8, 24]
# Dine In Orders: [12, 19, 2]
# Served Orders: [17, 8, 12, 19, 24, 2]

# algorithm
# keep track of next order for both take_out and dine_in
# - initialize both at 0
# iterate over servered orders
#   - if served order as it one of two expected places
#     - if next_take_out == current_order
#       - next_take_out += 1
#     - if next_dine_in == current_order
#       - next_dine_in += 1
#   - if not, return false

# handle for out_of_bounds

# implement their solution, compare differences

def first_come_first_served?(take_out, dine_in, served)
  next_take_out, next_dine_in = 0, 0
  return false if take_out.size + dine_in.size != served.size

  served.each do |order|
    if take_out[next_take_out] != nil && take_out[next_take_out] == order
      next_take_out += 1
    elsif dine_in[next_dine_in] != nil && dine_in[next_dine_in] == order
      next_dine_in += 1
    else
      return false
    end
  end

  true
end

# def first_come_first_served?(take_out_orders, dine_in_orders, served_orders)
#   # base case
#   if served_orders.length == 0
#     true
#   # if first order in served_orders is the same as the first
#   # order in take_out_orders
#   elsif take_out_orders.length > 0 && take_out_orders[0] == served_orders[0]
#     # take the first order off take_out_orders and served_orders and recurse
#     first_come_first_served?(take_out_orders[1..-1], dine_in_orders, served_orders[1..-1])
#   # if the first order in served_orders is the same as the first in dine_in_orders
#   elsif dine_in_orders.length > 0 && dine_in_orders[0] == served_orders[0]
#     # take the first order off dine_in_orders and served_orders and recurse
#     first_come_first_served?(take_out_orders, dine_in_orders[1..-1], served_orders[1..-1])
#   # first order in served_orders doesn't match first in
#   # take_out_orders or dine_in_orders, so we know it's not first-come, first-served
#   else
#     false
#   end
# end

def run_tests
  desc = 'both registers have same number of orders'
  result = first_come_first_served?([1, 4, 5], [2, 3, 6], [1, 2, 3, 4, 5, 6])
  assert_true(result, desc)

  desc = 'registers have different lengths'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 2, 6, 3, 5])
  assert_false(result, desc)

  desc = 'one register is empty'
  result = first_come_first_served?([], [2, 3, 6], [2, 3, 6])
  assert_true(result, desc)

  desc = 'served orders is missing orders'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 6, 3, 5])
  assert_false(result, desc)

  desc = 'served orders has extra orders'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 2, 3, 5, 6, 8])
  assert_false(result, desc)

  desc = 'one register has extra orders';
  result = first_come_first_served?([1, 9], [7, 8], [1, 7, 8]);
  assert_false(result, desc)

  desc = 'one register has unserved orders';
  result = first_come_first_served?([55, 9], [7, 8], [1, 7, 8, 9]);
  assert_false(result, desc)

  desc = 'order numbers are not sequential'
  result = first_come_first_served?([27, 12, 18], [55, 31, 8], [55, 31, 8, 27, 12, 18])
  assert_true(result, desc)

end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
