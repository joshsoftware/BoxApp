
namespace :match_scheduling do
    task matches: :environment  do
      Match.destroy_all
      all_users = User.all 
        all_users.each do |u|
            user_id = u.id
            user_city_sport = UserCitySport.find_by(user_id: user_id)
            user_city_sport_id = user_city_sport.city_sport_id
           
            result= User.getOpponents(user_id)
            
            
            if result.size  > 3
                result.each do |x|
                  if x.id > user_id
                    a= UserCitySport.where(user_id: x.id)[0].user
                    m = Match.create(city_sport_id: user_city_sport_id )
                    m.users=[u, a]
                  end
                end
            end

        end

    end
end















          



