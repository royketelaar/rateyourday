class AnswersController < ApplicationController
  
  def index
    
  end
  
  def new
    days = Playlist.count_days(current_user.id)
    playlist = Playlist.all.where(:user_id => current_user.id)
    daily_questions = Playlist.all.where(:day => days)
    not_answered = daily_questions.where(:answer_id => nil)
    
    if playlist.blank?
      Playlist.generate(current_user.id)
    end
    
    if not_answered.empty?
      redirect_to root_path
    else
      $playlist_with_question = not_answered.order("RANDOM()").limit(1)
      q_id = Playlist.find($playlist_with_question).question_id
      
      $question = Question.find(q_id)
      @answer = Answer.new
    end
  end
  
  def create
    playlist_id = Playlist.find($playlist_with_question).id
    @answer = Answer.new(answer_params)
    @answer.playlist_id = playlist_id
    
    if @answer.save
      @playlist = Playlist.find(playlist_id)
      @playlist.update_attributes(:answer_id => @answer.id)
    end
    
    redirect_to root_path
  end
  
  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
  end
  
  def answer_params
    params.require(:answer).permit(:answer,:playlist_id)
  end
  
end