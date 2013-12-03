class RatingsController < ApplicationController
 
  def index
    $question = Question.find(random_question)
    @answer = Answer.new
  end

end
