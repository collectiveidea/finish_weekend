# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.delete_all
atlanta   = Event.create :name => "Atlanta",   :starts_at => "2012-06-02", :ends_at => "2012-06-03", :slug => "atlanta",    :price => 30.00
boston    = Event.create :name => "Boston",    :starts_at => "2012-03-24", :ends_at => "2012-03-25", :slug => "boston",    :price => 30.00
ann_arbor = Event.create :name => "Ann Arbor", :starts_at => "2012-02-25", :ends_at => "2012-02-26", :slug => "ann-arbor", :price => 30.00
holland   = Event.create :name => "Holland",   :starts_at => "2011-11-24", :ends_at => "2011-11-25", :slug => "holland",   :price => 10.00

Coupon.delete_all
Coupon.create :code => "ATLANTA",     :amount => 30.00, :event_id => atlanta._id
Coupon.create :code => "BOSTON",     :amount => 30.00, :event_id => boston._id
Coupon.create :code => "A2",         :amount => 30.00, :event_id => ann_arbor._id
Coupon.create :code => "COLLECTIVE", :amount => 10.00, :event_id => holland._id
