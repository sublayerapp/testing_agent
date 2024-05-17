class Santa
  attr_accessor :current_floor

  def initialize
    @current_floor = 0
  end

  def move_floors(directions)
    directions.each_char do |char|
      case char
      when '(' then @current_floor += 1
      when ')' then @current_floor -= 1
      end
    end
  end
end