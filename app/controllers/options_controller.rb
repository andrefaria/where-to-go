class OptionsController < ApplicationController
  
  respond_to :js
  
  def destroy
    @option = Option.find(params[:id])
    @option.destroy    
    flash[:notice] = "Option Gone!" 
  end
    
  def create    
    @option = Option.new(params[:option])    
    @option.save!
    flash[:notice] = "Option Added!" 
  end  
  
end
