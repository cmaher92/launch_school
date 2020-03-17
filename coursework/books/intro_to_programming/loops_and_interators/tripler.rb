# tripler.rb

def tripler(start)
  puts start
  if start < 100
    tripler(start * 3)
  end
end

tripler(1)
