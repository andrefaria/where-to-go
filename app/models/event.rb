class Event < ActiveRecord::Base
  has_many :options
  
  validates_presence_of :date
  

  def pick_a_place
    if self.options.empty? or self.options.length <= 1 then
      self.errors.add :place, 'To pick a place you should first add at least two options to the event'
      return false
    else
      old_place = self.place
      while self.place.nil? or self.place == old_place do
        self.place = self.options[rand(self.options.size())].name
      end
      return true
    end
    puts self.place
  end
  
end