
class User < ApplicationRecord
	validates :first_name, :last_name, uniqueness: true
end
