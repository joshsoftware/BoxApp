# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with
# its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the
# database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.create([
              {name: "Pune"},
              {name: "Mumbai"},
              {name: "New Delhi"},
              {name: "Chennai"},
              {name: "Chandigarh"},
              {name: "Kolkata"},
              {name: "Gurgaon"},
              {name: "Noida"},
              {name: "Jaipur"},
              {name: "Bengaluru"},
              {name: "Navi Mumbai"},
              {name: "Hyderabad"},
              {name: "Ahmedabad"},
              {name: "Goa"},
              {name: "Nagpur"},
              {name: "Patna"},
              {name: "Lucknow"},
              {name: "Aizawl"}
            ])

Sport.create([
          {name: 'Badminton'},
          {name: 'Table Tennis'},
          {name: 'Squash'},
          {name: 'Tennis'},
          {name: 'Racquetball'}
        ])

Level.create([
          {name: 'B1', description: 'Intermediate - Difficult'},
          {name: 'B2', description: 'Intermediate - Medium'},
          {name: 'B3', description: 'Intermediate - Easy'},
          {name: 'B4', description: 'Intermediate - Very Easy'},
          {name: 'C1', description: 'Beginner - Difficult'},
          {name: 'C2', description: 'Beginner - Medium'},
          {name: 'C3', description: 'Beginner - Easy'},
          {name: 'C4', description: 'Beginner - Very Easy'}
        ])

CitySport.create([
          {city_id: 1, sport_id: 1, number_of_boxes: 6, number_of_players: 5}
          {city_id: 1, sport_id: 2, number_of_boxes: 6, number_of_players: 5}
          {city_id: 1, sport_id: 3, number_of_boxes: 6, number_of_players: 5}
          {city_id: 1, sport_id: 4, number_of_boxes: 6, number_of_players: 5}
          {city_id: 2, sport_id: 2, number_of_boxes: 6, number_of_players: 5}
          {city_id: 2, sport_id: 3, number_of_boxes: 6, number_of_players: 5}
        ])

LevelCitySport.create([
          {level_id: 1, city_sport_id: 1},
          {level_id: 2, city_sport_id: 1},
          {level_id: 3, city_sport_id: 1},
          {level_id: 5, city_sport_id: 1},
          {level_id: 6, city_sport_id: 1},
          {level_id: 7, city_sport_id: 1},
          {level_id: 1, city_sport_id: 2},
          {level_id: 2, city_sport_id: 2},
          {level_id: 3, city_sport_id: 2},
          {level_id: 5, city_sport_id: 2},
          {level_id: 6, city_sport_id: 2},
          {level_id: 7, city_sport_id: 2},
          {level_id: 1, city_sport_id: 3},
          {level_id: 2, city_sport_id: 3},
          {level_id: 3, city_sport_id: 3},
          {level_id: 5, city_sport_id: 3},
          {level_id: 6, city_sport_id: 3},
          {level_id: 7, city_sport_id: 3},
          {level_id: 1, city_sport_id: 4},
          {level_id: 2, city_sport_id: 4},
          {level_id: 3, city_sport_id: 4},
          {level_id: 4, city_sport_id: 4},
          {level_id: 5, city_sport_id: 4},
          {level_id: 6, city_sport_id: 4},
          {level_id: 7, city_sport_id: 4},
          {level_id: 8, city_sport_id: 4},
          {level_id: 1, city_sport_id: 5},
          {level_id: 2, city_sport_id: 5},
          {level_id: 3, city_sport_id: 5},
          {level_id: 5, city_sport_id: 5},
          {level_id: 6, city_sport_id: 5},
          {level_id: 7, city_sport_id: 5},
          {level_id: 1, city_sport_id: 6},
          {level_id: 2, city_sport_id: 6},
          {level_id: 3, city_sport_id: 6},
          {level_id: 4, city_sport_id: 6},
          {level_id: 5, city_sport_id: 6},
          {level_id: 6, city_sport_id: 6},
          {level_id: 7, city_sport_id: 6},
          {level_id: 8, city_sport_id: 6},
        ])
