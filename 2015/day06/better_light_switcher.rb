# frozen_string_literal: true

require 'numo/narray' 
require 'byebug' 

class BetterLightSwitcher
  def initialize(commands)
    @commands = commands
    @grid = Numo::Int8.zeros(1000, 1000)
  end

  REGEX2 = /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/

  def process_commands_part1
    @commands.split("\n").each do |str|
      match_data = str.match(REGEX2)
      next unless match_data

      command = match_data[1]
      x1 = match_data[2].to_i
      y1 = match_data[3].to_i
      x2 = match_data[4].to_i
      y2 = match_data[5].to_i

      execute_command_part1(x1, y1, x2, y2, command)
    end
  end

  def process_commands_part2
    @commands.split("\n").each do |str|
      match_data = str.match(REGEX2)
      next unless match_data

      command = match_data[1]
      x1 = match_data[2].to_i
      y1 = match_data[3].to_i
      x2 = match_data[4].to_i
      y2 = match_data[5].to_i

      execute_command_part2(x1, y1, x2, y2, command)
    end
  end

  def lit_lights_count
    @grid.sum
  end

  private

  def execute_command_part1(x1, y1, x2, y2, command)
    x_start, x_end = [x1, x2].sort
    y_start, y_end = [y1, y2].sort
    
    case command
    when "turn off"
      @grid[y_start..y_end, x_start..x_end] = 0
    when "turn on"
      @grid[y_start..y_end, x_start..x_end] = 1
    when "toggle"
      slice = @grid[y_start..y_end, x_start..x_end]
      @grid[y_start..y_end, x_start..x_end] = 1 - slice
    end
  end

  def execute_command_part2(x1, y1, x2, y2, command)
    x_start, x_end = [x1, x2].sort
    y_start, y_end = [y1, y2].sort
    slice = @grid[y_start..y_end, x_start..x_end]
    
    case command
    when "turn off"
      @grid[y_start..y_end, x_start..x_end] = (slice - 1).clip(0, nil)
    when "turn on"
      @grid[y_start..y_end, x_start..x_end] = slice + 1
    when "toggle"
      @grid[y_start..y_end, x_start..x_end] = slice + 2
    end
  end
end
