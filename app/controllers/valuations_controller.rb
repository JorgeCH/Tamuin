class ValuationsController < ApplicationController
	before_action :require_login!
	before_action :set_error, only: [:show, :edit, :update, :destroy]
	#GET /internals 
	def index
		if params[:query].present?
			@valuations = Valuation.search(params[:query], load: true)
		else
			@valuations = Valuation.all
		end
	end

	#GET /internals/:id
	def show
		@valuation = Valuation.find(params[:id])
	end

	def print
		@valuation = Valuation.find(params[:id])
		render layout: 'print'
	end

	#Get /internal/new
	def new
		@valuation = Valuation.new
	end

	def create 
		@valuation = Valuation.new(valuation_params)

		if @valuation.save
			redirect_to valuations_path
		else
			render :new
		end
	end

	def destroy 
		@valuation = Valuation.find(params[:id])
		@valuation.destroy

		redirect_to valuations_path
	end

	def edit
		@valuation = Valuation.find(params[:id])
	end

	def update
		@valuation = Valuation.find(params[:id])
		if @valuation.update(valuation_params)
			redirect_to valuation_path
		else
			render :edit
		end
	end

	private

	def valuation_params
		params.require(:valuation).permit(:nombre, :id_internal, :padecimiento, :sintoma, :trat_prev, :ex_aus, 
			:exa_ment, :diagnostico, :pronostico, :trat_sug, :medico, :id_internal, 
			:TA, :FC, :FR, :TEMP, :peso, :talla)
	end

	def set_error
		@valuation = Valuation.find(params[:id])

		rescue  ActiveRecord::RecordNotFound
		flash[:alert] = "La página o registro que está buscando no existe. Verifique sus datos de búsqueda."
		redirect_to internals_path
			
	end
end