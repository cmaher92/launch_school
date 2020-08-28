def drop_while(col)
  result = []
  falsey_found = false
  col.each do |e| 
    # if the block returns false or nil or falsey_found
      # set falsey_found to true
      # add element to result
    # else
      # next
    if falsey_found || !!yield(e) == false
      falsey_found = true
      result << e
    else
      next
    end
  end
  result
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []