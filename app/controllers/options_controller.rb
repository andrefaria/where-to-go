class OptionsController < ApplicationController
  
  respond_to :js
  
  def destroy
    @option = Option.find(params[:id])
    @option.destroy    
    flash[:notice] = "Option Removed!" 
  end
    
  def create    
    @option = Option.new(params[:option])   

    if @option.name.strip.empty? then
     @option = nil
     flash[:notice] = "Please enter a valid place" 
    elsif @option.name.downcase == 'natural da terra' then
      @option = nil
      flash[:notice] = "Unknown Error!" 
    else
      @option.save!
      flash[:notice] = "Option Added!" 
    end
  end  
  
end
