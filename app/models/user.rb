class User < ActiveRecord::Base
	attr_accessible :google_id, :mac_addr, :token, :in_range

	validates :google_id, :presence => true, :uniqueness => true
	validates :mac_addr, :presence => true, :uniqueness => true
end
