class Admin::BaseController < ApplicationController
	def index
		@users = User.order(:email)
	end
end