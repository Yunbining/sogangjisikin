class Subgroup < ActiveRecord::Base
    belongs_to :group
    has_many :posts
    
     def self.search(search)
        # Title is for the above case, the OP incorrectly had 'name'
        where("title LIKE ? OR prof_name LIKE ?", "%#{search}%","%#{search}%")
        
    end
end
