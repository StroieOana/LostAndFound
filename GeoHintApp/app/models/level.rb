class Level < ActiveRecord::Base
	has_many :hints
	has_many :users
end
