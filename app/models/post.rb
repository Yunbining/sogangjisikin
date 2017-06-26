class Post < ActiveRecord::Base
    belongs_to :subject
    has_many :replies
    
    has_many :likes
    has_many :users, through: :likes
    
    mount_uploader :image_url, ImageUploader
end
