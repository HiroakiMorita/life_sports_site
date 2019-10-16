class MypageController < ApplicationController
  before_action :move_to_index

  def index
  end

  def profile
  end 

  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end
