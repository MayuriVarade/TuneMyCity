# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
     Role.create(:name => "Superadmin")
	 Role.create(:name => "Cityadmin")
	 Role.create(:name => "user")

    superadmin = User.create(:name => 'Superadmin', :email=> 'superadmin@padmin.com', :password => 'admin123!')
    superadmin.roles = [Role.first]
    superadmin.save


    admin = User.create(:name => 'Cityadmin', :email=> 'cityadmin@cityadmin.com', :password => 'admin123')
    admin.roles = Role.where(:name =>"Cityadmin")
    admin.save
   require 'csv'

	puts "Importing countries..."
	CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
	  Country.create! do |country|
	    country.id = row[0]
	    country.name = row[1]
	  end
	end

	puts "Importing states..."
	CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
	  State.create! do |state|
	    state.name = row[0]
	    state.country_id = row[2]
	  end
	end

	puts "Importing cities..."
	CSV.foreach(Rails.root.join("city.csv"), headers: true) do |row|
	  City.create! do |city|
	    city.city_name = row[0]
	    city.state_id = row[1]
	  end
	end