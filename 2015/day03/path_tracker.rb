# frozen_string_literal: true

class PathTracker
  attr_reader :directions

  def initialize(directions)
    @directions = directions
  end

  def houses_visited_count
    houses_visited = {}
    current_x = 0
    current_y = 0
    houses_visited[[current_x, current_y]] = true
    directions.each_char do |direction|
      current_x, current_y = move_to_next_house(current_x, current_y, direction)
      houses_visited[[current_x, current_y]] = true
    end
    houses_visited.count
  end

  def houses_with_santa_robo
    santa_houses_visited = {}
    santa_robo_houses_visited = {}
    santa_current_x = 0
    santa_current_y = 0
    santa_robo_current_x = 0
    santa_robo_current_y = 0
    santa_houses_visited[[santa_current_x, santa_current_y]] = true
    santa_robo_houses_visited[[santa_robo_current_x, santa_robo_current_y]] = true
    directions.each_char.with_index do |direction, i|
      if i.odd?
        santa_current_x, santa_current_y = move_to_next_house(santa_current_x, santa_current_y, direction)
        santa_houses_visited[[santa_current_x, santa_current_y]] = true
      else
        santa_robo_current_x, santa_robo_current_y = move_to_next_house(santa_robo_current_x, santa_robo_current_y,
                                                                        direction)
        santa_robo_houses_visited[[santa_robo_current_x, santa_robo_current_y]] = true
      end
    end
    santa_houses_visited.merge(santa_robo_houses_visited).count
  end

  private

  def move_to_next_house(current_x, current_y, direction)
    case direction
    when '>' then [current_x + 1, current_y]
    when '<' then [current_x - 1, current_y]
    when '^' then [current_x, current_y - 1]
    when 'v' then [current_x, current_y + 1]
    end
  end
end
