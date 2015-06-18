class Valuation < ActiveRecord::Base

	validates :nombre, presence: true
	validates :padecimiento, :sintoma, :trat_prev, :ex_aus, :exa_ment, :diagnostico, :pronostico, :trat_sug, :medico, presence: true
	validates :id_internal, :TA, :FC, :FR, :TEMP, :peso, :talla, numericality: true

	include Tire::Model::Search
	include Tire::Model::Callbacks

end
