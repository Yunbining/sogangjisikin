class CreateRereplies < ActiveRecord::Migration
  def change
    create_table :rereplies do |t|
      t.integer :reply_id
      t.text :content
      t.timestamps null: false
    end
  end
end
