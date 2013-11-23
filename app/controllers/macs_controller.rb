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
		piconet_id = resp["piconet_id"]
		p macs_in_range
		p "piconet_id: "
		p piconet_id

		works = true
		err = nil

		User.all.each do |user|
			if macs_in_range and piconet_id
				if macs_in_range.include?(user.mac_addr)
					user.piconet_id = piconet_id
				else
					user.piconet_id = nil
				end
			end
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