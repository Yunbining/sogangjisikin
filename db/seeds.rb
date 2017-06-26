# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'subjects.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
  s = Subject.new
  s.year = row['year']
  s.semester = row['semester']
  s.major = row['major']
  s.subname = row['subname']
  s.subcode = row['subcode']
  s.credit = row['credit']
  s.time = row['time']
  s.professor = row['professor']
  s.save
  puts "#{s.year},#{s.semester},#{s.major},#{s.subname},#{s.subcode},#{s.credit},#{s.time},#{s.professor} saved"
  
end