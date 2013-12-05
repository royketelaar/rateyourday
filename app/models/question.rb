class Question < ActiveRecord::Base
  
  has_one :answer
  belongs_to :user
  
  def self.random
    Question.offset(rand(Question.count)).first
  end  
  
end
