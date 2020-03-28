require 'pry'

# def mix(s1, s2)
#   common_strings = ('a'..'z').map{ |c| [c, s1.count(c), s2.count(c)]}
#   .select { |v| v[1] > 1 || v[2] > 1 }
  
#   common_strings.map! do |letter, count_1, count_2|
#     case count_1 <=> count_2
#     when 1
#       "1:#{letter * count_1}"
#     when -1
#       "2:#{letter * count_2}"
#     else
#       "=:#{letter * count_1}"
#     end
#   end.sort.join('/')
# end

# def mix(s1, s2)
#   hist=('a'..'z').map{|c| [c, s1.count(c), s2.count(c)]}.select{|v| v[1]>1||v[2]>1}
#   hist2  = hist.map do |v|
#     arr = [ v[1] > v[2] ? -v[1] : -v[2] , v[1] > v[2] ? '1' : v[1] < v[2] ? '2' : '=', v[0]] 
#     arr
#   end
#   binding.pry
#   hist2.sort.map{|v| v[1]+':'+v[2]*-v[0]}.join('/')
# end

# using an array to sort size, string_label, alphabetically

def mix(s1, s2)
  hist = ('a'..'z').map do |c| 
    [c * s1.count(c), c * s2.count(c) ]
  end.select { |c1, c2| c1.length > 1 || c2.length > 1 }
end

# p mix("Are they here", "yes, they are here") == "2:eeeee/2:yy/=:hh/=:rr"
p mix("looping is fun but dangerous", "less dangerous than coding") 
#== "1:ooo/1:uuu/2:sss/=:nnn/1:ii/2:aa/2:dd/2:ee/=:gg"