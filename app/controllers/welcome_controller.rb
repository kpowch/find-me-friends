class WelcomeController < ApplicationController

  #public welcome page
  def index
    @hello_world_props = { name: "Paige" }
  end

  #send to profile page
  def show

  end

end
