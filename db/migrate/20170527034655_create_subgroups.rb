class CreateSubgroups < ActiveRecord::Migration
  def change
    create_table :subgroups do |t|
      t.text :title
      t.text :prof_name
      t.integer :group_id
      t.timestamps null: false
    end
  end
end
