class UsersController < ApplicationController
  
  def show
    
    user = User.find(params[:id])
    # @prototype = Prototype.find(params[:id])
    # @name = current_user.name
    @user_name = user.name
    @profile = user.profile
    @occupation = user.occupation
    @position = user.position
    # @prototype = Prototype.find(params[:id])
    # @prototypes = @Prototype.title
    @prototypes = Prototype.includes(:user).order("created_at DESC")
  end
  
  private
  def user_params
    params.require(:user).permit[:name,:email,:profile,:occupation,:position]
  end
end
