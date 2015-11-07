require_relative 'spec_helper'
# # Units start off alive but they die if their HP hits 0 or lower. 
# This is usually a result of receiving damage from combat.

# # Implementation: Define a method dead? on the Unit class. We add it to Unit instead 
# of Footman for example b/c all units can die, not just footman or peasants.

describe Unit do 

  describe "#dead?" do
    
    it "returns true if health points are at zero" do
      unit = Unit.new(0, 10)
      expect(unit.health_points).to eq(0)
      expect(unit.dead?).to be(true)
    end

  end

end