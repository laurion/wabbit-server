class User < ActiveRecord::Base
	attr_accessible :google_id, :mac_addr, :token, :in_range
end
