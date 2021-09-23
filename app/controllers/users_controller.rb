class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @name = current_user.name
    @profile = current_user.profile
    @occupation = current_user.occupation
    @position = current_user.position
  end
  
  private
  def user_params
    params.require(:user).permit[:name,:email,:profile,:occupation,:position]
  end
end
