require 'json'
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username
puts "What's your GitHub username?"
username = gets.chomp

url = "https://api.github.com/users/#{username}"

json = open(url).read
user_info = JSON.parse(json) # user hash

puts "#{user_info['name']} works at #{user_info['company']} company, this is the blog: #{user_info['blog']}"
