# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = City.create([
          {name: 'Pune'},
          {name: 'Mumbai'},
          {name: 'New Delhi'},
          {name: 'Chennai'},
          {name: 'Chandigarh'},
          {name: 'Kolkata'},
          {name: 'Gurgaon'},
          {name: 'Noida'},
          {name: 'Jaipur'},
          {name: 'Bengaluru'},
          {name: 'Navi Mumbai'},
          {name: 'Hyderabad'},
          {name: 'Ahmedabad'},
          {name: 'Goa'},
          {name: 'Nagpur'},
          {name: 'Patna'},
          {name: 'Lucknow'},
          {name: 'Aizawl'}
        ])

sports = Sport.create([
          {name: 'Badminton'},
          {name: 'Table Tennis'},
          {name: 'Squash'},
          {name: 'Tennis'},
          {name: 'Racquetball'}
        ])