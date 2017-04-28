class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: 'tellmewhatyouwant', password: 'whatyoureallyreallywant'

  def show
  end

end
