require 'open-uri'
require 'nokogiri'
require 'pry'
require 'pdf-reader'

url = "https://www.mass.gov/info-details/covid-19-cases-quarantine-and-monitoring"
input = URI.open(url)
document = Nokogiri::HTML(input)
result = document.at("#main-content > div.main-content.main-content--two > div > div > div:nth-child(1) > div > p:nth-child(3) > a:nth-child(2)")
latest_update_string = result.children.to_s
date_str = latest_update_string.split(' ')[6..-1]

link_to_download = result.attributes['href'].value
pdf = URI.open("https://www.mass.gov#{link_to_download}")
reader = PDF::Reader.new(pdf)
reader.pages[0].text.gsub(/[\W]/, ' ').scan(/[\w]+/).join(' ')
binding.pry


# TODO
# - parse the confirmed cases, new cases, total deaths, new deaths, barnstable cases
# - print the data
# - organize