class ProfilesController < ApplicationController

  helper ProfileHelper

  # This shows the user's profile - their name, info, friends
  def index
    # Pass in props to profile page
    @profile_props = {
      current_user: current_user
    }
  end
end
