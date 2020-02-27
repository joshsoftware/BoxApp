require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
set :environment, Rails.env

set :output, 'log/whenever.log'
every "0 0 1 * *" do
  rake "match_scheduling:matches"
end




#for particular time
# 1.day, at: '4:30 am


#for  first day of every month at midnight
#' 0 0 1 * *'  