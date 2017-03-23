# Low or Nothing

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.select! { |key, value| value < 25 }

p numbers
