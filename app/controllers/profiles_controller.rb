class ProfilesController < ApplicationController 
  before_action :authenticate_user!
  
  def index
    @user_email = current_user.email
    @recipe_count = current_user.recipes.count
  end  

end