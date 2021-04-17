require 'json'

# TODO - let's read/write data from beers.json
filepath = 'data/beers.json'

serialized_beers = File.read(filepath)

beers = JSON.parse(serialized_beers)

belgian = beers["beers"].select do |beer|
  beer['origin'] == 'Belgium'
end

beers = {
  beers: [
    {
      name:       'Asahi',
      appearance: 'White',
      origin:     'Japan'
    },
    {
      name:       'Sapporo',
      appearance: 'Stout',
      origin:     'Japan'
    }
]}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end
