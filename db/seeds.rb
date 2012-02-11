# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
cmu = School.create(:name => "Carnegie Mellon University")
c1 = Channel.create(:name => "15-251", :school_id => cmu.id)
c2 = Channel.create(:name => "random", :school_id => cmu.id)