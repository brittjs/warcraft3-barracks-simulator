require_relative 'spec_helper'

describe Barracks do 

  before :each do
    @barracks = Barracks.new
  end

  describe "#damage" do
    
    it "should reduce the barrack's health_points by 5" do
      @footman = Footman.new
      @footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495) # starts at 500
    end

  end
  
  
end
