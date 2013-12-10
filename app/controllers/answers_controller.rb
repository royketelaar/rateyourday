class AnswersController < ApplicationController
  
  def index
    
    
  end
  
  def new
    days = Playlist.count_days(current_user.id)
    user_playlist = Playlist.all.where(:user_id => current_user.id)
    daily_questions = user_playlist.where(:day => days)
    not_answered = daily_questions.where(:answer_id => nil)
    
    if user_playlist.blank?
      Playlist.generate(current_user.id)
    end
    
    if not_answered.empty?
      redirect_to answers_path
    else
      @playlist_with_question = not_answered.first
      q_id = Playlist.find(@playlist_with_question).question_id
      
      @question = Question.find(q_id)
      @answer = Answer.new
    end
  end
  
  def create
    playlist = Playlist.find(params[:answer][:playlist_id])
    @answer = Answer.new(answer_params)
    @answer.playlist_id = playlist.id
    
    if @answer.save
      @playlist = playlist
      @playlist.update_attributes(:answer_id => @answer.id)
    end
    
    redirect_to root_path
  end
  
  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
  end
  
  def answer_params
    params.require(:answer).permit(:answer, :playlist_id)
  end
  
end