class Event < ActiveRecord::Base
  has_many :options
  
  validates_presence_of :date
  

  def pick_a_place
    if self.options.empty? then
      self.errors.add :place, 'To pick a place you should first add some options to the event'
      return false
    else
      self.place = self.options[rand(self.options.size())].name
      return true
    end
  end
  
end