require 'HTTParty'
require 'nokogiri'

file = HTTParty.get('https://en.wikipedia.org/wiki/Steve_Jobs')
html = Nokogiri::HTML(file)

output = File.new('steve-jobs-story.txt', 'w+')

name = html.at_css('#firstHeading').text
birthday = html.at_css('.bday').text
deathday = html.at_css('.dday').text
cause_of_death = html.at_xpath('//a[@title="Pancreatic cancer"]').text

output.write(name + ' was born on ' + birthday+ "\n" )
output.write ('They also died on ' + deathday + ' due to ' + cause_of_death + "\n" )
