
  class Date
  
    def count_days(user_id)
      current_user = User.find(user_id)
      begin_date = current_user.created_at.strftime("%d-%m-%Y").to_i
      end_date = DateTime.now.strftime("%d-%m-%Y").to_i
  
      (end_date - begin_date)
    end
  
  end