# A dead unit cannot attack another unit. Conversely, an alive unit will 
# also not attack another unit that is already dead.
require_relative 'spec_helper'

describe Unit do 

  before :each do
    @unit = Unit.new(60, 10)
  end

  describe "#attack!" do

    it "should not be able to attack if dead" do
      enemy_unit = Unit.new(100, 10)
      @unit.health_points = 0
      @unit.attack!(enemy_unit)
      expect(enemy_unit.health_points).to eq(100)
    end
  
    it "should not be able to attack a dead enemy"


  end
  
end