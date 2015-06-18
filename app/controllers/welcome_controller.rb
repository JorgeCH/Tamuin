class WelcomeController < ApplicationController
	before_action :require_login!, except: [:index]
	before_action :set_error, only: [:show, :edit, :update, :destroy] 
	def index
		@users = User.order(:email)
  	end

  	def show
		@internal = Internal.find(params[:id])

	end

  	private

  	def set_error
		@welcome = Welcome.find(params[:id])

		rescue  ActiveRecord::RecordNotFound
		flash[:alert] = "La página o registro que está buscando no existe. Verifique sus datos de búsqueda."
		redirect_to internals_path
			
	end
end
