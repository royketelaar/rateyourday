class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
    playlist_item = Playlist_item.all.where(:user_id => current_user.id)
    @answer = Answer.all.where(:playlist_id => playlist_item).order("created_at DESC")
    @answer_by_day = @answer.first(6).group_by { |t| t.created_at.beginning_of_day }
    
    vitality = Question.all.where(:scale_id => 1)
    dedication = Question.all.where(:scale_id => 2)
    absorption = Question.all.where(:scale_id => 3)
    
    vitality_playlist_item = playlist_item.where(:question_id => vitality)
    dedication_playlist_item = playlist_item.where(:question_id => dedication)
    absorption_playlist_item = playlist_item.where(:question_id => absorption)
    
    @vitality = Answer.all.where(:playlist_id => vitality_playlist_item)
    @dedication = Answer.all.where(:playlist_id => dedication_playlist_item)
    @absorption = Answer.all.where(:playlist_id => absorption_playlist_item)
    
    days = playlist_item.count_days(current_user.id) 
    daily_questions = Playlist_item.all.where(:user_id => current_user.id).where(:day => days)
    
    if daily_questions.empty?
      playlist_item.generate(current_user.id)
    end
    
    def search_on_job(job)
      User.all.where(:employment => job)
    end

	end
end
