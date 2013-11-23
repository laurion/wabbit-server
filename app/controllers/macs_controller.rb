class MacsController < ApplicationController
	# attr_accessible :mac_addr

	# def index
	# 	@users = User.all


 #    respond_to do |format|
 #      format.html # index.html.erb
 #      format.json { render json: @users }
 #    end
	# end

	def create
		p params
		resp = JSON.parse request.body.read()
		p resp
		macs_in_range = resp["macs"]
		p macs_in_range

		works = true
		err = nil

		User.all.each do |user|
			user.in_range = macs_in_range.include?(user.mac_addr)
			if not user.save
				works = false
			else
				err = user.errors
			end
		end

		respond_to do |format|
      if works
        # format.html { redirect_to @user, notice: 'Macs were successfully received.' }
        format.json { render json: resp, status: :created, location: resp }
      else
        # format.html { render action: "new" }
        format.json { render json: err.errors, status: :unprocessable_entity }
      end
    end

	end
end