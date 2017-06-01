class Post < ActiveRecord::Base
    belongs_to :subgroup
    has_many :replies

end
