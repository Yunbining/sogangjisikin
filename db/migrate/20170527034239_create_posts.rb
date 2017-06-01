class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.integer :visit
      t.integer :subgroup_id
      t.integer :user_id
      t.integer :selected
      t.string :image_url, default: ""
      
      t.timestamps null: false
    end
  end
end
