class Admin::ChatroomsController < ApplicationController
  http_basic_authenticate_with name: 'tellmewhatyouwant', password: 'whatyoureallyreallywant'

  def show
  end

  def index
  end

  def destroy
  end
end
