class Playlist < ActiveRecord::Base
  
  belongs_to :user
  has_one :question
  has_one :answer
  
  DAYS = 9
  QUESTIONS_PER_DAY = 3
  SEC_TO_DAY = 86400
  
  def self.count_days(user_id)
    
    current_user = User.find(user_id)
    begin_date = current_user.created_at.to_f
    end_date = DateTime.now.to_f
  
    ((end_date - begin_date) / SEC_TO_DAY).round
  end
  
  def self.generate(user_id)
    random_questions = Question.order("RANDOM()").limit(QUESTIONS_PER_DAY * DAYS)

    current = Playlist.count_days(user_id)
    
    random_questions.each do |question| 
      item = Playlist.new
      item.day = current.floor
      item.question_id = question.id
      item.user_id = user_id
      item.save
      
      current += 1.to_f / QUESTIONS_PER_DAY.to_f
    end
  end  

end