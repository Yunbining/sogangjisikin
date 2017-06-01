class Group < ActiveRecord::Base
    has_many :subgroups
end
