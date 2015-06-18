class Consent < ActiveRecord::Base

	validates :encargado, presence: true
	validates :acuerdo, :medicamentos, presence: true, length: { minimum: 50 }
	validates :cuota, :duracion, numericality: true
end
