# Ruby Control Structures - Each

=begin
In this challenge, your task is to write a method convert_temp that helps 
in temperature conversion. The method will receive a number as an input (temperature), 
a named parameter input_scale (scale for input temperature), 
and an optional parameter output_scale (output temperature scale, defaults to Celsius) 
and return the converted temperature. It should perform interconversion between Celsius, 
Fahrenheit and Kelvin scale.
=end

=begin
input:
	- temperature: integer
  - input_scale: string
    - scale for input temperature
  - (optional) output_scale: string
    - default: "celsius"
    - farenheit, kelvin
output:
	- Float
rules/constraints:
  - kelvin to celsius
    - temp - 273.15
  - celsius to kelvin
    - temp + 273.14
  - fahrenheit to celsius
    - celsius = (f - 32) * (5/9)
  - celsius to fahrenheit
    - f = c * 9/5 + 32
test input/output:
algorithm/data structure:
  - convert input to celcius
    - if input is celcius return input
    - if input is fahrenheit
      - (input - 32) * 5/9
    - if input is kelvin
      - input - 273.15
  - convert celcius to output
    - if output is celcius, return temp
    - if output is fahrenheit
      - return temp * 9/5 + 32
    - if output is kelvin
      - return temp - 273.15
=end

def convert_temp(temp, input_scale:, output_scale: 'celsius')
  temp = temp.to_f
  case input_scale
  when 'fahrenheit' then temp = (temp - 32) * 5/9
  when 'kelvin' then temp = temp - 273.15
  end

  case output_scale
  when 'fahrenheit' then return (temp * 9/5 + 32)
  when 'kelvin' then return temp + 273.15
  end
  temp
end

# Test Cases
p convert_temp(0, input_scale: 'celsius', output_scale: 'kelvin') #== 273.15
p convert_temp(0, input_scale: 'celsius', output_scale: 'fahrenheit') #== 32.0
p convert_temp(0, input_scale: 'fahrenheit')