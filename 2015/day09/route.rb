class Route
  attr_reader :cities, :map

  def initialize(cities, distance_map)
    @cities = cities
    @map = distance_map
  end

  def total_distance
    distance = 0
    cities.each_cons(2) do |two_cities|
      distance += distance_between(two_cities[0], two_cities[1])
    end
    distance
  end

  def distance_between(city_a, city_b)
    map.distance(city_a, city_b)
  end
end
