class WelcomeController < ApplicationController
  def index
  	@user = current_user
    @users = User.all
  end

  def show
  	@user = User.find_by_id(params[:id])
  end

  def destroy
  	@user = User.find(params[:id])
	@user.destroy
	redirect_to new_user_registration_path
  end


end
