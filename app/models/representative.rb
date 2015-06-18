class Representative < ActiveRecord::Base
	validates :nombre_rep, :apellido_rep, :parentesco, :dir_rep, :tel_1, :tel_2, presence: true
	validates :edad, numericality: true
end
