class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
		@work = User.all
	end
end
