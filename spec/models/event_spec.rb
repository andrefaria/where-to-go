require 'spec_helper'


describe Event do

  it "shouldn't save without a name" do
    event = Event.new
    lambda { event.save! }.should raise_error
  end  
  
  describe "pick a event" do
    it "should pick a event" do
      event = Event.new
      event.options << Option.new(:name => 'Natural da Terra')
      event.options << Option.new(:name => 'Burger King')
    
      event.pick_a_place
      event.place.should_not be_nil
      event.options.collect{|x| x.name}.should include(event.place)    
    end
    
    it "should say that it cant pick a event if the option list is empty" do
      event = Event.new
      event.pick_a_place
      event.errors[:place].should include("To pick a place you should first add some options to the event")
    end
    
  end
end