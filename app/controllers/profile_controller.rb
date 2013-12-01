class ProfileController < ApplicationController
 
  def show
    user = current_user
    allAttributes = user.attributes.values.count - 15
    empty = user.attributes.values.select(&:blank?).count - 3
    
    @percint = ((allAttributes - empty).to_d / allAttributes) * 100
    
  end
 
end
