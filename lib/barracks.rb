require_relative 'footman'
require_relative 'peasants'

class Barracks

  attr_reader :health_points, :gold, :food

  def initialize
    @health_points = 500
    @gold = 1000
    @food = 80
  end

  def can_train_peasant?
    gold >= 90 && food >= 5
  end


  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    else
      nil
    end
  end


  def can_train_footman?
    gold >= 135 && food >= 2
  end


  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    else
      nil
    end
  end


  def damage(attack_power)
    @health_points -= attack_power
  end

end


