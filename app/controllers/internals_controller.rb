class InternalsController < ApplicationController
	before_action :require_login!
	before_action :set_error, only: [:show, :edit, :update, :destroy]

	#GET /internals 
	def index
		if params[:query].present?
			@internals = Internal.search(params[:query], load: true)
		else
			@internals = Internal.all
		end
	end

	#GET /internals/:id
	def show	
		@internal = Internal.find(params[:id])
		@representative = Representative.find(params[:id])
		@consent = Consent.find(params[:id])

	end

	def print
		@internal = Internal.find(params[:id])
		@representative = Representative.find(params[:id])
		@consent = Consent.find(params[:id])
		render layout: 'print'
	end

	#Get /internal/new
	def new
		@internal = Internal.new
	end

	def create 
		@internal = Internal.new(internal_params)

		if @internal.save
			redirect_to "/representatives/new"
		else
			render :new
		end
	end

	def destroy 
		@internal = Internal.find(params[:id])
		@representative = Representative.find(params[:id])
		@consent = Consent.find(params[:id])
		@internal.destroy
		@representative.destroy
		@consent.destroy
		redirect_to internals_path
	end

	def edit
		@internal = Internal.find(params[:id])
	end

	def update
		@internal = Internal.find(params[:id])
		if @internal.update(internal_params)
			redirect_to edit_representative_path
		else
			render :edit
		end
	end

	private

	def internal_params
		params.require(:internal).permit(:nombre,:apellido,:sexo,:f_nacimiento,:edad,:dir,:tel,
			:nacionalidad,:estado_civil,:escolaridad,:ocupacion,:ingreso_prev,:referencia,
			:tipo_ingreso,:motivo,:stado)
	end

	def set_error
		@internal = Internal.find(params[:id])

		rescue  ActiveRecord::RecordNotFound
		flash[:alert] = "La página o registro que está buscando no existe. Verifique sus datos de búsqueda."
		redirect_to internals_path
			
	end
end