
def doubler(value)
    puts value
    doubler(value * 2) if value < 10
end

doubler(2)