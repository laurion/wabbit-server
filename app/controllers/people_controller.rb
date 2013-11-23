class PeopleController < ApplicationController

	def index
		@users = User.where("piconet_id is NOT NULL")


    respond_to do |format|
      # format.html # index.html.erb
      format.json { render json: @users }
    end
	end
end