# class ApplicationController < ActionController::Base
#   before_action :authenticate_user!
#   def after_sign_in_path_for(resource)
#     user_ingredients_path
#   end
#   def after_sign_up_path_for(resource)
#     user_ingredients
#   end
# end
# app/controllers/application_controller.rb

def default_url_options
  { host: heroku config:set DOMAIN=www.no-mess.life || "localhost:3000" }
end
