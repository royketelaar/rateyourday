class HomeController < ApplicationController
	def index
		redirect_to :controller=>'dashboard', :action=> 'index'
	end
end
