class RepresentativesController < ApplicationController
	before_action :require_login!
	before_action :set_error, only: [:show, :edit, :update, :destroy]
	#GET /internals 
	def index
		@representatives = Representative.all
		
	end

	#GET /internals/:id
	def show
		@representative = Representative.find(params[:id])
	end

	#Get /internal/new
	def new
		@representative = Representative.new
	end

	def create 
		@representative = Representative.new(representative_params)

		if @representative.save
			
			redirect_to "/consents/new"
		else
			render :new
		end
	end

	def destroy 
		@representative = Representative.find(params[:id])
		@representative.destroy
		redirect_to internals_path
	end

	def edit
		@representative = Representative.find(params[:id])
	end

	def update
		@representative = Representative.find(params[:id])
		if @representative.update(representative_params)
			redirect_to edit_consent_path
		else
			render :edit
		end
	end

	private

	def representative_params
		params.require(:representative).permit(:nombre_rep,:apellido_rep,:edad,:parentesco,:dir_rep,:tel_1,:tel_2)
	end

	def set_error
		@representative = Representative.find(params[:id])

		rescue  ActiveRecord::RecordNotFound
		flash[:alert] = "La página o registro que está buscando no existe. Verifique sus datos de búsqueda."
		redirect_to internals_path
			
	end

end