class BuildingExterior < ApplicationRecord
	belongs_to :exterior
	has_many :building_exterior_questions
end
