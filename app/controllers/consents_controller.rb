class ConsentsController < ApplicationController
	before_action :require_login!
	before_action :set_error, only: [:show, :edit, :update, :destroy]
	#GET /internals 
	def index
		@consents = Consent.all
	end

	#GET /internals/:id
	def show
		@consent = Consent.find(params[:id])
	end

	#Get /internal/new
	def new
		@consent = Consent.new
	end

	def create 
		@consent = Consent.new(consent_params)

		if @consent.save
			redirect_to "/internals"
		else
			render :new
		end
	end

	def destroy 
		@consent = Consent.find(params[:id])
		@consent.destroy
		redirect_to internals_path
	end

	def edit
		@consent = Consent.find(params[:id])
	end

	def update
		@consent = Consent.find(params[:id])
		if @consent.update(consent_params)
			redirect_to internal_path
		else
			render :edit
		end
	end

	private

	def consent_params
		params.require(:consent).permit(:cuota,:acuerdo,:duracion,:medicamentos,:encargado)
	end

	def set_error
		@consent = Consent.find(params[:id])

		rescue  ActiveRecord::RecordNotFound
		flash[:alert] = "La página o registro que está buscando no existe. Verifique sus datos de búsqueda."
		redirect_to internals_path
			
	end

end