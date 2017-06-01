class Post < ActiveRecord::Base
    belongs_to :subgroup
    has_many :replies
    
    mount_uploader :image_url, ImageUploader
end
