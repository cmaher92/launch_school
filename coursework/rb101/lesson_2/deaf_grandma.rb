# Deaf Grandma
# Practicing Pseudo-code

# Whatever you say to Grandma she should respond with
# HUH?! SPEAK UP, SONNY!
# unless you shout, which she then will respond
# NO, NOT SINCE 1938!
# Have each year be random between 1930 and 1950
# Can't stop talking to grandma ntil you shout BYE

# Informal psuedo-code
response = ''

loop 
   prints 'what would you like to say to your grandma?'
   gets response
   if the response is bye
     break the loop
   elsif response is lowercase
     print "HUH?! SPEAK UP, SONNY"
   elsif response is uppercase
     set random_year to a year between 1930 and 1950
     print "No, not since random_year"
   end

# Formal psuedo-code
START

SET response = nil

LOOP
  GET 'What would you like to say to your grandma?'
  SET response
  IF    response == 'BYE'
    exit the loop
  ELSIF response == response.downcase
    PRINT "Huh?! SPEAK UP, SONNY!"
  ELSIF response == response.upcase
    SET random_year = calculate_random_year
    PRINT "No, not since random_year"
    
END