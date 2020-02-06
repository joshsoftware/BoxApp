require 'rails_helper'

describe "post token and return opponents list", :type => :request do
    before do
        User.create(first_name: "mayur", last_name: "deshmukh", contact_number: 512,role: false, email: "mayur.deshmukh@joshsoftware.com",city_id: 1)
        User.create(first_name: "sagar", last_name: "sonwane", contact_number: 4892,role: false, email: "sagar.sonwane@joshsoftware.com",city_id: 1)
        Sport.create(name: "Badminton")
        City.create(name: "Pune")
        CitySport.create(city_id: 1,sport_id: 1,number_of_boxes: 5,)

end