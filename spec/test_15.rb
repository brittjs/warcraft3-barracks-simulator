require_relative 'spec_helper'

# It is however ineffective against other units (can't attack them, as though they were dead).

# # Also, Siege Engines can attack other siege engines even though they cannot attack any 
# # other units (such as Peasants or Footmen)

# # Stats:

# # AP: 50
# # HP: 400
# # Cost: 200 gold, 60 lumber, 3 food
describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "should be a Unit" do
    expect(@siege_engine).to be_an_instance_of(SiegeEngine)
    # But should also be a Unit
    expect(@siege_engine).to be_a(SiegeEngine)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end 

  describe "#damage" do
    it "should reduce other Siege Engine's health_points by the attack_power specified" do
      @other_siege_engine = SiegeEngine.new
      @other_siege_engine.damage(50)
      expect(@other_siege_engine.health_points).to eq(350) # HP started at 400 but just got hit by 50
    end  

    it "should reduce the barrack's health_points by 100" do
      @barracks = Barracks.new
      @siege_engine.attack!(@barracks)
      expect(@barracks.health_points).to eq(400) # starts at 500
    end
  end

  describe "#attack!" do
    it "should not be able to attack Peasants" do
      @peasant = Peasant.new
      @siege_engine.attack!(@peasant)
      expect(@peasant.health_points).to eq(35)
    end

    it "should not be able to attack Footmen" do
      @footman = Footman.new
      @siege_engine.attack!(@footman)
      expect(@footman.health_points).to eq(60)  
    end

    it "should deal the appropriate (attack power based) damage to other siege units" do
      @enemy_siege_unit = SiegeEngine.new
      expect(@enemy_siege_unit).to receive(:damage).with(50)
      @siege_engine.attack!(@enemy_siege_unit)
    end
  end

end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#can_train_siege_engine?" do
    it "returns true if there are enough resources to train a Siege Engine" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple footmen
      expect(@barracks.can_train_siege_engine?).to be_truthy
    end
    
    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 1 food item left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 134 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      # Make the barracks believe it only has 134 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end
  end

  describe "#train_siege_engine" do 
    it "does not train a siege engine if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(false)
      expect(@barracks.train_siege_engine).to be_nil
    end

    it "trains a siege engine if there are enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(true)
      expect(@barracks.train_siege_engine).to be_a(SiegeEngine)
    end
  end

end
