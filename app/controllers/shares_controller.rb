class SharesController < ApplicationController
	before_action :require_login!
	before_action :set_error, only: [:show, :edit, :update, :destroy]
	#GET /internals 
	def index
		if params[:query].present?
			@shares = Share.search(params[:query], load: true)
		else
			@shares = Share.all
		end
	end

	#GET /internals/:id
	def show
		@share = Share.find(params[:id])
	end

	#Get /internal/new
	def new
		@share = Share.new
	end

	def create 
		@share = Share.new(share_params)

		if @share.save
			redirect_to shares_path
		else
			render :new
		end
	end

	def destroy 
		@share = Share.find(params[:id])
		@share.destroy

		redirect_to shares_path
	end

	def edit
		@share = Share.find(params[:id])
	end

	def update
		@share = Share.find(params[:id])
		if @share.update(share_params)
			redirect_to shares_path
		else
			render :edit
		end
	end

	private

	def share_params
		params.require(:share).permit(:nombre, :id_internal, :num_pago, :cantidad)
	end

	def set_error
		@share = Share.find(params[:id])

		rescue  ActiveRecord::RecordNotFound
		flash[:alert] = "La página o registro que está buscando no existe. Verifique sus datos de búsqueda."
		redirect_to internals_path
			
	end
end