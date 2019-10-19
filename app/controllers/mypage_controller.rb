class MypageController < ApplicationController
  before_action :move_to_index

  def index
    @user = User.find(current_user.id)
    # binding.pry
  end

  def profile
  end
  
  def message
  end

  def show
    @user = User.find(current_user.id)
    @profile = Profile.find(params[:id])
    @old = Old.find_by(id: @profile.old)
    # binding.pry
  end

  def edit
    # binding.pry
    @user = User.find(current_user.id)
    @profile = Profile.find(params[:id])
  end

  def update
    # binding.pry
    @profile = Profile.find(params[:id])
    @user = User.find(current_user.id)
    if @profile.update(profile_params)
      redirect_to mypage_index_path(@user)
    else
      render :edit
    end
  end

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
    params.require(:profile).permit(:message).merge(user_id: current_user.id)
    
  end
end
