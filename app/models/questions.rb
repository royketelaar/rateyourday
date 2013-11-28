class Question < ActiveRecord::Base
	has_many :answers, :scales
end
