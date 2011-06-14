require 'spec_helper'

describe OptionsController do
  fixtures :events
    
  describe "Add an option via Ajax"  do

    before(:all) do
      @event = Event.find(1)
    end 
        
    specify "event should have 0 options"  do
      @event.should have(0).options
    end    

    it "should add a option to the event" do
      xhr :post, :create, {:option => {:name => 'teste',:event_id => 1}}     
      response.should render_template("options/create")      
      response.code.should == "200"
      @event.should have(1).options
    end    
    
    it "should remove a option of the event" do      
      id = @event.options[0].id
      xhr :delete, :destroy, {:id => id }
      response.should render_template("options/destroy")
      event.options.count.should == 0
      response.code.should == "200"      
    end
    
  end
  
end