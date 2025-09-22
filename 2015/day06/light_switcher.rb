# frozen_string_literal: true

class LightSwitcher
  attr_reader :grid, :commands
  
  def initialize(grid, commands)
    @grid = grid
    @commands = commands
  end
  
  REGEX = /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/

  def process_commands
    commands.split("\n").each do |str|
      match_data = str.match(REGEX)
      next unless match_data

      command = match_data[1]
      x1 = match_data[2].to_i
      y1 = match_data[3].to_i
      x2 = match_data[4].to_i
      y2 = match_data[5].to_i

      execute_command(grid, x1, y1, x2, y2, command)
    end
  end

  def lit_lights_count
    @grid.flatten.sum
  end

  private

  def execute_command(grid, x1, y1, x2, y2, command)
    x_start, x_end = [x1, x2].sort
    y_start, y_end = [y1, y2].sort
    (y_start..y_end).each do |y|
      (x_start..x_end).each do |x|
        if grid[y] && grid[y][x]
          case command
          when "turn off"
            turn_off(x, y)
          when "turn on"
            turn_on(x, y)
          when "toggle"
            toggle(x, y)
          end
        end
      end
    end
  end

  def turn_off(x, y)
    grid[y][x] = 0
  end

  def turn_on(x, y)
    grid[y][x] = 1
  end

  def toggle(x, y)
    grid[y][x] = (grid[y][x] == 0) ? 1 : 0
  end
end
