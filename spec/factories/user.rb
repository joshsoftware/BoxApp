FactoryBot.define do
  factory :user do
    Faker::Config.locale = "en-IND"
    email    { Faker::Internet.email }
    password {"123456"}
    password_cofirmation {"123456"}
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    is_admin {false}
    city_id {1}
    contact_number {"1230234983"}#{ Faker::PhoneNumber.phone_number }
    # email {'temp@gmail.com'}
    # password {'temp123'}
    # first_name {'temp'}
    # last_name {'kumar'}
    # contact_number {'1230984567'}

  end
end