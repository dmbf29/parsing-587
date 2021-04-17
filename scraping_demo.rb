require 'open-uri'
require 'nokogiri'

url = "https://www.bbcgoodfood.com/search/recipes?q=cheesecake"
html = open(url).read
html_doc = Nokogiri::HTML(html)

# .seach => goes through Nokogiri objects
# .text => pull all of the text from that object
# .attribute('href').value => pull attributes from the HTML

# to search for an id
# html_doc.search('#header').count

# to search for an HTML element
# p html_doc.search('h4').count

# to search for an HTML class
html_doc.search('.standard-card-new').each do |card|
  # p element # what is this going to be? Nokogiri object
  # p card
  puts title = card.search('.standard-card-new__article-title').text.strip
  puts ''
end
