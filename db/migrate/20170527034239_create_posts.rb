class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.integer :visit
      t.integer :user_id
      t.integer :selected
      t.string :image_url, default: ""
      t.integer :subject_id
      t.string :subject_subname
      t.string :subject_professor
      t.string :subject_major

      
      t.timestamps null: false
    end
  end
end
