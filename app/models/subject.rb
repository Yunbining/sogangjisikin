class Subject < ActiveRecord::Base
    has_many :posts
    def self.search(search)
        # Title is for the above case, the OP incorrectly had 'name'
        where("subname LIKE ? OR professor LIKE ?", "%#{search}%","%#{search}%")
        
    end
    

end
