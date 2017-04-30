# Admin controllers inherit from this base controller
class AdminController < ApplicationController
  # authentication filter so only admin can see admin pages
  # TODO put these in some kind of hidden .env file? it's been giving us timing error
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']
end
