class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
    playlist = Playlist.all.where(:user_id => current_user.id)
    @answer = Answer.all.where(:playlist_id => playlist).order("created_at")
    
    vitality = Question.all.where(:scale_id => 1)
    dedication = Question.all.where(:scale_id => 2)
    absorption = Question.all.where(:scale_id => 3)
    
    vitality_playlist = playlist.where(:question_id => vitality)
    dedication_playlist = playlist.where(:question_id => dedication)
    absorption_playlist = playlist.where(:question_id => absorption)
    
    @vitality = Answer.all.where(:playlist_id => vitality_playlist)
    @dedication = Answer.all.where(:playlist_id => dedication_playlist)
    @absorption = Answer.all.where(:playlist_id => absorption_playlist)
    
    
   
    
	end
end
