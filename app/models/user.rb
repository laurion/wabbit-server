class User < ActiveRecord::Base
	attr_accessible :uid, :google_id, :mac_addr, :token
end
