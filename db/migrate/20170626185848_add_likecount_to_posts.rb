class AddLikecountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likecount, :integer, default:0
  end
end
