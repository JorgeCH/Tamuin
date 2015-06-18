class Internal < ActiveRecord::Base
	
	validates :nombre, :sexo, :dir, :ingreso_prev, :tipo_ingreso, :motivo, :stado, presence: true
	validates :edad, numericality: true

	include Tire::Model::Search
	include Tire::Model::Callbacks

end
