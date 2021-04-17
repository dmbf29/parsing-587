require 'csv'

# TODO - let's read/write data from beers.csv
filepath = 'data/beers.csv'


# Parsing

# CSV.foreach(filepath) do |row|
#   puts "#{row[0]} has the appearance of #{row[1]} and it's from #{row[2]}"
# end

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

beers = []
CSV.foreach(filepath, csv_options) do |row|
  beers << [row['Name'], row['Appearance'], row['Origin']]
  # puts "#{row['Name']} has the appearance of #{row['Appearance']} and it's from #{row['Origin']}"
end

puts "Whats the name of the new beer"
name = gets.chomp
puts "Whats the appearance of the new beer"
appearance = gets.chomp
puts "Whats the origin of the new beer"
origin = gets.chomp

beers << [name, appearance, origin]



# students.sort_by { |student| student.downcase }
# students.sort_by(&:downcase)

# Storing
csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

# 'wb' -> write (rewrite the entire file)
# # 'ab' -> append (add a line to the end of it)
CSV.open(filepath, 'wb', csv_options) do |csv|
  beers.each do |beer|
    csv << beer
  end
end
