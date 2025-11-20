class DistanceMap
  attr_reader :cities, :distances

  def initialize
    @distances = Hash.new { |hash, key| hash[key] = {} }
    @cities = []
  end

  def self.from_entries(entries)
    map = new
    entries.each do |line|
      match = line.match(/^([a-zA-Z]+) to ([a-zA-Z]+) = ([\d]+)/)
      map.add_route(match[1], match[2], match[3].to_i)
    end
    map
  end

  def add_route(city_a, city_b, distance)
    cities << city_a unless cities.include?(city_a)
    cities << city_b unless cities.include?(city_b)

    distances[city_a][city_b] = distance
    distances[city_b][city_a] = distance
  end

  def distance(from, to)
    distances[from][to]
  end
end
