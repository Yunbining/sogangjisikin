class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      # t.integer :is_re_reply, :default => 0
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
