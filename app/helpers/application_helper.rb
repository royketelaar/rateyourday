module ApplicationHelper
  
  def user_percentage
    user = current_user
    allAttributes = user.attributes.values.count - 15
    empty = user.attributes.values.select(&:blank?).count - 3
    
    ((allAttributes - empty).to_d / allAttributes) * 100 
  end
  
  def notification
    count = Playlist.all.where(:user_id => current_user.id).where(:day => (Playlist.count_days(current_user.id))).where(:answer_id => nil).count
    
    if count == 0
      nil
    else
      count
    end
  end
  
end
