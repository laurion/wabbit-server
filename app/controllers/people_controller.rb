class PeopleController < ApplicationController
	# attr_accessible :mac_addr

	def index
		@users = User.where(in_range: true)


    respond_to do |format|
      # format.html # index.html.erb
      format.json { render json: @users }
    end
	end
end