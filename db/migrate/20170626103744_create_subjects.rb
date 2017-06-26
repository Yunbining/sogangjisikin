class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      
      t.string :year
      t.string :semester
      t.string :major
      t.string :subname
      t.string :subcode
      t.string :credit
      t.string :time
      t.string :professor
      
      t.timestamps null: false
    end
  end
end
