class Guest < ActiveRecord::Base
    has_one :room
end
