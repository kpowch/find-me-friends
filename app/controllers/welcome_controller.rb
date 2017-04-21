class WelcomeController < ApplicationController

  #public welcome page
  def index
    @hello_world_props = { name: "Stranger" }
  end

  #send to profile page
  def show

  end

end
