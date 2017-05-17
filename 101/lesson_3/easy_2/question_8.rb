# question_8.rb

advice = "Few things in life are as important as house training your pet dinosaur."

# Shorten the sentence, remove everything starting with 'house'.

advice.slice(0..38)
advice.slice("Few things in life are as important as ")

# solution
advice.slice!(0, advice.index('house'))
