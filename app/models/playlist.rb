class Playlist < ActiveRecord::Base
  
  belongs_to :user
  
  DAYS = 9
  QUESTIONS_PER_DAY = 3
  
  def self.generate(user_id)
    random_questions = Question.order("RANDOM()").limit (QUESTIONS_PER_DAY * DAYS)

    current = 0
    random_questions.each do |question| 
      item = Playlist.new
      item.day = current % DAYS
      item.question_id = question.id
      item.user_id = user_id
      item.save
      
      current += 1
    end
  end  
  
  def self.count_days(user_id)
    current_user = User.find(user_id)
    begin_date = current_user.created_at.strftime("%d-%m-%Y").to_i
    end_date = DateTime.now.strftime("%d-%m-%Y").to_i
  
    (end_date - begin_date)
  end
end