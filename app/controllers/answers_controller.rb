class AnswersController < ApplicationController
  
  def index
    @answer = Answer.all.where(:user_id => current_user.id)
  end
  
  def new
    def count_days
      begin_date = current_user.created_at.strftime("%d-%m-%Y").to_i
      end_date = DateTime.now.strftime("%d-%m-%Y").to_i
      
      if begin_date = 0
        begin_date + 3
      end
    
      max_answers = (end_date - begin_date) * 3
    end
  
    count_answers = Answer.all.where(:user_id => current_user.id).count
    
    if !(count_days == count_answers)
      @question = Question.random
      @answer = Answer.new
    else
      redirect_to root_path
    end
  end
  
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = $question.id
    @answer.user_id = current_user.id
    @answer.save
    redirect_to root_path
  end
  
  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
  end
  
  def answer_params
    params.require(:answer).permit(:answer, assets_attributes: [ :question_id ])
  end

end