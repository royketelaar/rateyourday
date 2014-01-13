class Question < ActiveRecord::Base
  
  has_one :playlist
  belongs_to :scale
  
end
