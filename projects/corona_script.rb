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
text = reader.pages[0].text.gsub(/[\W]/, ' ').scan(/[\w]+/).join(' ')
cases = text.match(/Cases Reported \d+/).to_s.match(/\d+/).to_s
new_cases = text.match(/\d+ new cases/).to_s.match(/\d+/).to_s
deaths = text.match(/total of \d+/).to_s.match(/\d+/).to_s
new_deaths = text.match(/\d+ new deaths/).to_s.match(/\d+/).to_s
barnstable = text.match(/Barnstable \d+/).to_s.match(/\d+/).to_s
info = [cases, new_cases, deaths, new_deaths, barnstable]
labels = %w(cases: new_cases: deaths: new_deaths: barnstable:)
final_d = []
info.each_with_index { |d, i| final_d << [labels[i], d].join(' ') }
final_d.each { |str| puts str }

# TODO
# - refactor this nightmare 
# - pull the website
# - compare current date to download link's date
#   - if new, pull data
# - learn about parsing a pdf better
# - set up cronjob to check for new data
# - set script to email me if data is new