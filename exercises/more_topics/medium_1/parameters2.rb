list = %w(raven finch hawk eagle)

def parameter(arr)
  yield(arr)
end

parameter(list) { |first, second, *raptors| p raptors }
