class ProfilesController < ApplicationController
  before_action :move_to_index

  def index
    # binding.pry
    @user = User.find(current_user.id)
  end

  def profile
  end
  
  def message
  end

  def edit
    # binding.pry
    @profile = Profile.find(current_user.id)
  end

  def show
    @profile = @profile.message
    @profile = Profile.find(params[:profile_id])
  end


  def update
    # binding.pry
    @profile = Profile.find(current_user.id)
    if @profile.update(current_user.id)
      redirect_to profile_mypage_path(@profile)
    else
      render :edit
    end
    # binding.pry
  end

  # def update
  #   @profile = Profile.find(params[:id])
  #   # binding.pry
  #   if profile.user_id == current_user.id
  #     profile.update(profile_params)
  #   end
  # end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
  def user_params
    params.require(:user).permit(
      :nickname
    )
  end
  def profile_params
    # binding.pry
    params.require(:profile).permit(:message[:id])
  end
end
