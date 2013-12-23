class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
    playlist = Playlist.all.where(:user_id => current_user.id)
    @answer = Answer.all.where(:playlist_id => playlist).order("created_at DESC")
    @answer_by_day = @answer.last(2).group_by { |t| t.created_at.beginning_of_day }
    
    vitality = Question.all.where(:scale_id => 1)
    dedication = Question.all.where(:scale_id => 2)
    absorption = Question.all.where(:scale_id => 3)
    
    vitality_playlist = playlist.where(:question_id => vitality)
    dedication_playlist = playlist.where(:question_id => dedication)
    absorption_playlist = playlist.where(:question_id => absorption)
    
    @vitality = Answer.all.where(:playlist_id => vitality_playlist)
    @dedication = Answer.all.where(:playlist_id => dedication_playlist)
    @absorption = Answer.all.where(:playlist_id => absorption_playlist)
    
    days = Playlist.count_days(current_user.id) 
    daily_questions = Playlist.all.where(:user_id => current_user.id).where(:day => days)
    
    if daily_questions.empty?
      Playlist.generate(current_user.id)
    end
	end
end
