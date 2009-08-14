class WelcomeController < ApplicationController
  
  def index
  
    @mods = Mod.find :all
    @teams = Team.find :all
  
  end
  
end
