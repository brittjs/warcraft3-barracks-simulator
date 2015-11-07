# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'

class Footman < Unit

  def initialize
    super(60, 10)
  end

  def attack!(enemy)
    if enemy.is_a?(Unit)
      super(enemy)
    else
      enemy.damage(5)
    end
  end

end

