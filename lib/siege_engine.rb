require_relative 'unit'
require_relative 'barracks'

class SiegeEngine < Unit

  attr_accessor :health_points, :attack_power

  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    unless self.dead? || enemy.dead? || enemy.is_a?(Footman) || enemy.is_a?(Peasant)
      if enemy.is_a?(SiegeEngine)
        super(enemy)
    else
      enemy.damage(100)
    end
    end
  end



end