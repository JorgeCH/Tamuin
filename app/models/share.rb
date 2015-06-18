class Share < ActiveRecord::Base

	validates :nombre, presence: true
	validates :id_internal, :num_pago, :cantidad, numericality: true

	include Tire::Model::Search
	include Tire::Model::Callbacks

end
