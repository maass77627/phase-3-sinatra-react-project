require 'pry'

class Recipe < ActiveRecord::Base
belongs_to :category

def days_since_last_cooked
   (Date.today - self.last_cooked_on).to_i
    
end

def capitalize_title
     
  array = self.name.split
  newarray = array.map { |word| word.capitalize}
  string = newarray.join(" ")
  self.name = string
  self.save
  
end








end