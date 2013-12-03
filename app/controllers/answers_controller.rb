class AnswersController < ApplicationController
  
  def index
    @answer = Answer.all.where(:user_id => current_user.id)
  end
  
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = $question.id
    @answer.user_id = current_user.id
    
    
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
  end
  
  def answer_params
    params.require(:answer).permit(:answer, assets_attributes: [ :question_id ])
  end

end