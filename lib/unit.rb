class Unit 

  attr_accessor :attack_power, :health_points

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    unless self.dead? || enemy.dead?
      enemy.damage(attack_power)
    end
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

  def dead?
    @health_points == 0
  end

end


