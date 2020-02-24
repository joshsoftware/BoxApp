# frozen_string_literal: true

namespace :batch do
  desc "insert values in database"
  task insert_values: :environment do
    User.create(first_name: "Qwerty", last_name: "Kumari", contact_number: "8421985646")
    puts "In batch"
  end
end
