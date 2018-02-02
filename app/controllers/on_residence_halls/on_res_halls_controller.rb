module OnResidenceHalls
	class OnResHallsController < ApplicationController
		include SessionsHelper

		def building_exterior 
			@user = current_user
			@building_exterior = BuildingExterior.new
			@question = BuildingExteriorQuestion.new
		end

		def grounds_gardens
		end

		def parking_driveway_signage
		end

		def safety_security
		end 

	end
end